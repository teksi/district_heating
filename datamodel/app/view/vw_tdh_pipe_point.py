#!/usr/bin/env python3
#
# -- View: vw_tdh_pipe_point

import argparse
import os

import psycopg
import psycopg.sql
from pirogue.utils import insert_command, select_columns, table_parts, update_command
from yaml import safe_load

# from .utils.extra_definition_utils import (
#     extra_cols,
#     extra_joins,
#     insert_extra,
#     update_extra,
# )


def vw_tdh_pipe_point(
        connection: psycopg.Connection, srid: psycopg.sql.Literal, extra_definition: dict = None
):
    """
    Creates tdh_pipe_point view
    :param srid: EPSG code for geometries
    :param pg_service: the PostgreSQL service name
    :param extra_definition: a dictionary for additional read-only columns
    """
    extra_definition = extra_definition or {}

    cursor = connection.cursor()

    view_sql = """
    DROP VIEW IF EXISTS tdh_app.vw_tdh_pipe_point;

    CREATE OR REPLACE VIEW tdh_app.vw_tdh_pipe_point AS
     SELECT

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

        , {pn_columns}

        , {pf_columns}

        FROM tdh_od.pipe_point pp
        LEFT JOIN tdh_od.pipe_point_normal pn ON pn.obj_id = pp.obj_id
        LEFT JOIN tdh_od.pipe_point_feed pf ON pf.obj_id = pp.obj_id;

    """.format(
        # srid=srid,
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
                # "name_number",
                "fk_owner",
                # "_label",
                # "_cover_label",
                # "_bottom_label",
                # "_input_label",
                # "_output_label",
                # "geometry3d_geometry",
            ],
        ),
        pn_columns=select_columns(
            pg_cur=cursor,
            table_schema="tdh_od",
            table_name="pipe_point_normal",
            table_alias="pn",
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
            prefix="pf_",
            remap_columns={},
        ),
        # extra_joins="\n    ".join(
        # [
        # "LEFT JOIN {tbl} {alias} ON {jon}".format(
        # tbl=table_def["table"],
        # alias=table_def.get("alias", ""),
        # jon=table_def["join_on"],
        # )
        # for table_def in extra_definition.get("joins", {}).values()
        # ]
        # ),
    )

    cursor.execute(view_sql)

    trigger_insert_sql = """
    CREATE OR REPLACE FUNCTION tdh_app.ft_vw_tdh_pipe_point_INSERT()
      RETURNS trigger AS
    $BODY$
    BEGIN

      NEW.obj_id = NEW.obj_id;

    {insert_pp}

      CASE
        WHEN NEW.pp_type = 'pipe_point_feed' THEN
        -- pipe_point_feed
    {insert_pf}

        -- pipe_point_normal
        WHEN NEW.pp_type = 'pipe_point_normal' THEN
    {insert_pn}

        ELSE
         RAISE NOTICE 'Pipe point type not handled by this view (%)', NEW.pp_type; -- ERROR
      END CASE;

      RETURN NEW;
    END; $BODY$ LANGUAGE plpgsql VOLATILE;

    DROP TRIGGER IF EXISTS vw_tdh_pipe_point_INSERT ON tdh_app.vw_tdh_pipe_point;

    CREATE TRIGGER vw_tdh_pipe_point_INSERT INSTEAD OF INSERT ON tdh_app.vw_tdh_pipe_point
      FOR EACH ROW EXECUTE PROCEDURE tdh_app.ft_vw_tdh_pipe_point_INSERT();
    """.format(
        insert_pp=insert_command(
            pg_cur=cursor,
            table_schema="tdh_od",
            table_name="pipe_point",
            table_alias="pp",
            remove_pkey=False,
            indent=2,
            skip_columns=[
                # "_label",
                # "_cover_label",
                # "_bottom_label",
                # "_input_label",
                # "_output_label",
                # "geometry3d_geometry",
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
    CREATE OR REPLACE FUNCTION tdh_app.ft_vw_tdh_pipe_point_UPDATE()
      RETURNS trigger AS
    $BODY$
    DECLARE
      dx float;
      dy float;
    BEGIN

      {update_pp}

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


      RETURN NEW;
    END;
    $BODY$
    LANGUAGE plpgsql;



    DROP TRIGGER IF EXISTS vw_tdh_pipe_point_UPDATE ON tdh_app.vw_tdh_pipe_point;

    CREATE TRIGGER vw_tdh_pipe_point_UPDATE INSTEAD OF UPDATE ON tdh_app.vw_tdh_pipe_point
      FOR EACH ROW EXECUTE PROCEDURE tdh_app.ft_vw_tdh_pipe_point_UPDATE();
    """.format(
        # srid=srid,
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
                # "geometry3d_geometry",
                "last_modification",
                # "_label",
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
    CREATE OR REPLACE FUNCTION tdh_app.ft_vw_tdh_pipe_point_DELETE()
      RETURNS trigger AS
    $BODY$
    DECLARE
    BEGIN
      DELETE FROM tdh_od.pipe_point WHERE obj_id = OLD.obj_id;
    RETURN OLD;
    END; $BODY$ LANGUAGE plpgsql VOLATILE;

    DROP TRIGGER IF EXISTS vw_tdh_pipe_point_DELETE ON tdh_app.vw_tdh_pipe_point;

    CREATE TRIGGER vw_tdh_pipe_point_DELETE INSTEAD OF DELETE ON tdh_app.vw_tdh_pipe_point
      FOR EACH ROW EXECUTE PROCEDURE tdh_app.ft_vw_tdh_pipe_point_DELETE();
    """

    cursor.execute(trigger_delete_sql)

    extras = """
    ALTER VIEW tdh_app.vw_tdh_pipe_point ALTER obj_id SET DEFAULT tdh_app.generate_oid('tdh_od','pipe_point');
    """
    cursor.execute(extras)


if __name__ == "__main__":
    # create the top-level parser
    parser = argparse.ArgumentParser()
    parser.add_argument("-s", "--srid", help="EPSG code for SRID", default=2056)
    parser.add_argument(
        "-e",
        "--extra-definition",
        help="YAML file path for extra additions to the view",
    )
    parser.add_argument("-p", "--pg_service", help="the PostgreSQL service name")
    args = parser.parse_args()
    pg_service = args.pg_service or os.getenv("PGSERVICE")
    srid = psycopg.sql.Literal(args.srid)
    extra_definition = safe_load(open(args.extra_definition)) if args.extra_definition else {}
    with psycopg.connect(f"service={pg_service}") as conn:
        vw_tdh_pipe_point(
            connection=conn, srid=srid, extra_definition=extra_definition
        )
