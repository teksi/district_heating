#!/usr/bin/env python3
#
# -- View: vw_tdh_pipe_point

import argparse
import os

try:
    import psycopg
except ImportError:
    import psycopg2 as psycopg

from pirogue.utils import insert_command, select_columns, table_parts, update_command
from yaml import safe_load


def vw_tdh_pipe_point(srid: int, pg_service: str = None, extra_definition: dict = None):
    """
    Creates tdh_pipe_point view
    :param srid: EPSG code for geometries
    :param pg_service: the PostgreSQL service name
    :param extra_definition: a dictionary for additional read-only columns
    """
    if not pg_service:
        pg_service = os.getenv("PGSERVICE")
    assert pg_service
    extra_definition = extra_definition or {}

    conn = psycopg.connect(f"service={pg_service}")
    cursor = conn.cursor()

    view_sql = """
    DROP VIEW IF EXISTS tww_app.vw_tdh_pipe_point;

    CREATE OR REPLACE VIEW tww_app.vw_tdh_pipe_point AS
     SELECT
        pp.identifier as identifier,

        CASE
          WHEN pn.obj_id IS NOT NULL THEN 'pipe_point_normal'
          WHEN pf.obj_id IS NOT NULL THEN 'pipe_point_feed'
          ELSE 'unknown'
        END AS pp_type

        , pn.kind AS pn_kind
        , pf.kind as pf_kind
        , pp.fk_owner

        {extra_cols}

        , {pp_cols}

        , ST_Force2D(COALESCE(wn.situation3d_geometry, main_co.situation3d_geometry))::geometry(Point, {srid}) AS situation3d_geometry

        , {pn_columns}

        , {pf_columns}

        , pp._label
        # , pp._cover_label
        # , pp._bottom_label
        # , pp._input_label
        # , pp._output_label
        # , wn._usage_current AS _channel_usage_current
        # , wn._function_hierarchic AS _channel_function_hierarchic

        FROM tdh_od.pipe_point pp
        LEFT JOIN tdh_od.pipe_point_normal pn ON pn.obj_id = pp.obj_id
        LEFT JOIN tdh_od.pipe_point_feed pf ON pf.obj_id = pp.obj_id
        # WHERE '-1'=ALL(ARRAY[ch.obj_id,dt.obj_id,sm.obj_id,wt.obj_id]) IS NULL
        # AND '-2'=ALL(ARRAY[ch.obj_id,dt.obj_id,sm.obj_id,wt.obj_id]) IS NULL;

    """.format(
        srid=srid,
        extra_cols="\n    ".join(
            [
                select_columns(
                    pg_cur=cursor,
                    table_schema=table_parts(table_def["table"])[0],
                    table_name=table_parts(table_def["table"])[1],
                    skip_columns=table_def.get("skip_columns", []),
                    remap_columns=table_def.get("remap_columns", {}),
                    prefix=table_def.get("prefix", None),
                    table_alias=table_def.get("alias", None),
                )
                + ","
                for table_def in extra_definition.get("joins", {}).values()
            ]
        ),
        pp_cols=select_columns(
            pg_cur=cursor,
            table_schema="tdh_od",
            table_name="pipe_point",
            table_alias="pp",
            remove_pkey=False,
            indent=4,
            skip_columns=[
                "identifier",
                "fk_owner",
                "_label",
                # "_cover_label",
                # "_bottom_label",
                # "_input_label",
                # "_output_label",
                "detail_geometry3d_geometry",
            ],
        ),
        pn_columns=select_columns(
            pg_cur=cursor,
            table_schema="tdh_od",
            table_name="pipe_point_normal",
            table_alias="pf",
            remove_pkey=True,
            indent=4,
            skip_columns=["kind"],
            prefix="pn_",
            remap_columns={},
        ),
        pf_columns=select_columns(
            pg_cur=cursor,
            table_schema="tdh_od",
            table_name="pipe_point_feed",
            table_alias="pf",
            remove_pkey=True,
            indent=4,
            skip_columns=["kind"],
            prefix="ss_",
            remap_columns={},
        ),
        extra_joins="\n    ".join(
            [
                "LEFT JOIN {tbl} {alias} ON {jon}".format(
                    tbl=table_def["table"],
                    alias=table_def.get("alias", ""),
                    jon=table_def["join_on"],
                )
                for table_def in extra_definition.get("joins", {}).values()
            ]
        ),
    )

    cursor.execute(view_sql)

    trigger_insert_sql = """
    CREATE OR REPLACE FUNCTION tww_app.ft_vw_tdh_pipe_point_INSERT()
      RETURNS trigger AS
    $BODY$
    BEGIN

      NEW.identifier = COALESCE(NEW.identifier, NEW.obj_id);

    {insert_pp}

      CASE
        WHEN NEW.pp_type = 'pipe_point_feed' THEN
        -- pipe_point_feed
    {insert_pf}

        -- Special Structure
        WHEN NEW.pp_type = 'pipe_point_normal' THEN
    {insert_pn}

        ELSE
         RAISE NOTICE 'Pipe point type not handled by this view (%)', NEW.pp_type; -- ERROR
      END CASE;

      RETURN NEW;
    END; $BODY$ LANGUAGE plpgsql VOLATILE;

    DROP TRIGGER IF EXISTS vw_tdh_pipe_point_INSERT ON tww_app.vw_tdh_pipe_point;

    CREATE TRIGGER vw_tdh_pipe_point_INSERT INSTEAD OF INSERT ON tww_app.vw_tdh_pipe_point
      FOR EACH ROW EXECUTE PROCEDURE tww_app.ft_vw_tdh_pipe_point_INSERT();
    """.format(
        insert_pp=insert_command(
            pg_cur=cursor,
            table_schema="tdh_od",
            table_name="pipe_point",
            table_alias="pp",
            remove_pkey=False,
            indent=2,
            skip_columns=[
                "_label",
                # "_cover_label",
                # "_bottom_label",
                # "_input_label",
                # "_output_label",
                "detail_geometry3d_geometry",
            ],
        ),
        insert_pn=insert_command(
            pg_cur=cursor,
            table_schema="tdh_od",
            table_name="pipe_point_normal",
            table_alias="pn",
            prefix="pn_",
            remove_pkey=False,
            indent=6,
            skip_columns=[
                # "_orientation",
            ],
            remap_columns={"obj_id": "obj_id"},
        ),
        insert_pf=insert_command(
            pg_cur=cursor,
            table_schema="tdh_od",
            table_name="pipe_point_feed",
            table_alias="pf",
            prefix="pf_",
            remove_pkey=False,
            indent=6,
            remap_columns={"obj_id": "obj_id"},
        ),
    )

    cursor.execute(trigger_insert_sql)

    update_trigger_sql = """
    CREATE OR REPLACE FUNCTION tww_app.ft_vw_tdh_pipe_point_UPDATE()
      RETURNS trigger AS
    $BODY$
    DECLARE
      dx float;
      dy float;
    BEGIN
      # {update_co}
      # {update_sp}
      {update_pp}
      # {update_wn}
      # {update_ne}

      IF OLD.pp_type <> NEW.pp_type THEN
        CASE WHEN OLD.pp_type <> 'unknown' THEN
          BEGIN
            EXECUTE FORMAT({literal_delete_on_pp_change});
          END;
        END CASE;

        CASE WHEN NEW.pp_type = ANY(ARRAY['pipe_point_feed','pipe_point_normal']) THEN
          BEGIN
            EXECUTE FORMAT({literal_insert_on_pp_change});
          END;
        END CASE;
      END IF;

      CASE
        WHEN NEW.pp_type = 'pipe_point_feed' THEN
          {update_pf}

        WHEN NEW.pp_type = 'pipe_point_normal' THEN
          {update_pn}

        ELSE -- do nothing
      END CASE;

        # -- Move reach point node as well
        # UPDATE tdh_od.reach_point RP
        # SET situation3d_geometry = ST_SetSRID( ST_MakePoint(
        # ST_X(ST_TRANSLATE(ST_MakePoint(ST_X(RP.situation3d_geometry), ST_Y(RP.situation3d_geometry)), dx, dy )),
        # ST_Y(ST_TRANSLATE(ST_MakePoint(ST_X(RP.situation3d_geometry), ST_Y(RP.situation3d_geometry)), dx, dy )),
        # ST_Z(RP.situation3d_geometry)), {srid} )
        # WHERE obj_id IN
        # (
          # SELECT RP.obj_id FROM tdh_od.reach_point RP
          # LEFT JOIN tdh_od.wastewater_networkelement NE ON RP.fk_wastewater_networkelement = NE.obj_id
          # WHERE NE.fk_wastewater_structure = NEW.obj_id
        # );


        # -- Move reach(es) as well
        # UPDATE tdh_od.reach RE
        # SET progression3d_geometry =
          # ST_ForceCurve (ST_SetPoint(
            # ST_CurveToLine (RE.progression3d_geometry ),
            # 0, -- SetPoint index is 0 based, PointN index is 1 based.
            # ST_SetSRID( ST_MakePoint(
                # ST_X(ST_TRANSLATE(ST_MakePoint(ST_X(ST_PointN(RE.progression3d_geometry, 1)), ST_Y(ST_PointN(RE.progression3d_geometry, 1))), dx, dy )),
                # ST_Y(ST_TRANSLATE(ST_MakePoint(ST_X(ST_PointN(RE.progression3d_geometry, 1)), ST_Y(ST_PointN(RE.progression3d_geometry, 1))), dx, dy )),
                # ST_Z(ST_PointN(RE.progression3d_geometry, 1))), {srid} )
          # ) )
        # WHERE fk_reach_point_from IN
        # (
          # SELECT RP.obj_id FROM tdh_od.reach_point RP
          # LEFT JOIN tdh_od.wastewater_networkelement NE ON RP.fk_wastewater_networkelement = NE.obj_id
          # WHERE NE.fk_wastewater_structure = NEW.obj_id
        # );

        # UPDATE tdh_od.reach RE
        # SET progression3d_geometry =
          # ST_ForceCurve( ST_SetPoint(
            # ST_CurveToLine( RE.progression3d_geometry ),
            # ST_NumPoints(RE.progression3d_geometry) - 1,
            # ST_SetSRID( ST_MakePoint(
                # ST_X(ST_TRANSLATE(ST_MakePoint(ST_X(ST_EndPoint(RE.progression3d_geometry)), ST_Y(ST_EndPoint(RE.progression3d_geometry))), dx, dy )),
                # ST_Y(ST_TRANSLATE(ST_MakePoint(ST_X(ST_EndPoint(RE.progression3d_geometry)), ST_Y(ST_EndPoint(RE.progression3d_geometry))), dx, dy )),
                # ST_Z(ST_PointN(RE.progression3d_geometry, 1))), {srid} )
          # ) )
        # WHERE fk_reach_point_to IN
        # (
          # SELECT RP.obj_id FROM tdh_od.reach_point RP
          # LEFT JOIN tdh_od.wastewater_networkelement NE ON RP.fk_wastewater_networkelement = NE.obj_id
          # WHERE NE.fk_wastewater_structure = NEW.obj_id
        # );
      # END IF;

      RETURN NEW;
    END;
    $BODY$
    LANGUAGE plpgsql;



    DROP TRIGGER IF EXISTS vw_tdh_pipe_point_UPDATE ON tww_app.vw_tdh_pipe_point;

    CREATE TRIGGER vw_tdh_pipe_point_UPDATE INSTEAD OF UPDATE ON tww_app.vw_tdh_pipe_point
      FOR EACH ROW EXECUTE PROCEDURE tww_app.ft_vw_tdh_pipe_point_UPDATE();
    """.format(
        srid=srid,
        literal_delete_on_pp_change="'DELETE FROM tdh_od.%I WHERE obj_id = %L',OLD.pp_type,OLD.obj_id",
        literal_insert_on_pp_change="'INSERT INTO tdh_od.%I(obj_id) VALUES (%L)',NEW.pp_type,OLD.obj_id",
        update_pp=update_command(
            pg_cur=cursor,
            table_schema="tdh_od",
            table_name="pipe_point",
            table_alias="pp",
            remove_pkey=False,
            indent=6,
            skip_columns=[
                "detail_geometry3d_geometry",
                "last_modification",
                "_label",
                # "_cover_label",
                # "_bottom_label",
                # "_input_label",
                # "_output_label",
            ],
            update_values={},
        ),
        update_pf=update_command(
            pg_cur=cursor,
            table_schema="tdh_od",
            table_name="pipe_point_feed",
            table_alias="pf",
            prefix="pf_",
            remove_pkey=True,
            indent=6,
            skip_columns=[
                # "_orientation"
            ],
            remap_columns={"obj_id": "obj_id"},
        ),
        update_pn=update_command(
            pg_cur=cursor,
            table_schema="tdh_od",
            table_name="pipe_point_normal",
            table_alias="pn",
            prefix="pn_",
            remove_pkey=True,
            indent=6,
            skip_columns=[],
            remap_columns={"obj_id": "obj_id"},
        ),
    )

    cursor.execute(update_trigger_sql)

    trigger_delete_sql = """
    CREATE OR REPLACE FUNCTION tww_app.ft_vw_tdh_pipe_point_DELETE()
      RETURNS trigger AS
    $BODY$
    DECLARE
    BEGIN
      DELETE FROM tdh_od.pipe_point WHERE obj_id = OLD.obj_id;
    RETURN OLD;
    END; $BODY$ LANGUAGE plpgsql VOLATILE;

    DROP TRIGGER IF EXISTS vw_tdh_pipe_point_DELETE ON tww_app.vw_tdh_pipe_point;

    CREATE TRIGGER vw_tdh_pipe_point_DELETE INSTEAD OF DELETE ON tww_app.vw_tdh_pipe_point
      FOR EACH ROW EXECUTE PROCEDURE tww_app.ft_vw_tdh_pipe_point_DELETE();
    """

    cursor.execute(trigger_delete_sql)

    extras = """
    ALTER VIEW tww_app.vw_tdh_pipe_point ALTER obj_id SET DEFAULT tww_app.generate_oid('tdh_od','pipe_point');
    # ALTER VIEW tww_app.vw_tdh_pipe_point ALTER co_obj_id SET DEFAULT tww_app.generate_oid('tdh_od','cover');
    # ALTER VIEW tww_app.vw_tdh_pipe_point ALTER wn_obj_id SET DEFAULT tww_app.generate_oid('tdh_od','wastewater_node');
    """
    cursor.execute(extras)

    conn.commit()
    conn.close()


if __name__ == "__main__":
    # create the top-level parser
    parser = argparse.ArgumentParser()
    parser.add_argument("-s", "--srid", help="EPSG code for SRID")
    parser.add_argument(
        "-e",
        "--extra-definition",
        help="YAML file path for extra additions to the view",
    )
    parser.add_argument("-p", "--pg_service", help="the PostgreSQL service name")
    args = parser.parse_args()
    srid = args.srid or os.getenv("SRID")
    pg_service = args.pg_service or os.getenv("PGSERVICE")
    extra_definition = safe_load(open(args.extra_definition)) if args.extra_definition else {}
    vw_tdh_pipe_point(srid=srid, pg_service=pg_service, extra_definition=extra_definition)
