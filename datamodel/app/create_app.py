#!/usr/bin/env python3

from argparse import ArgumentParser, BooleanOptionalAction
from pathlib import Path
from typing import Optional

try:
    import psycopg
except ImportError:
    import psycopg2 as psycopg

from pirogue import SingleInheritance

# from view.vw_tdh_reach import vw_tdh_reach
# from view.vw_tdh_wastewater_structure import vw_tdh_wastewater_structure


def run_sql_file(file_path: str, pg_service: str, variables: dict = None):
    abs_file_path = Path(__file__).parent.resolve() / file_path
    with open(abs_file_path) as f:
        sql = f.read()
    run_sql(sql, pg_service, variables)


def run_sql(sql: str, pg_service: str, variables: dict = None):
    if variables:
        sql = psycopg.sql.SQL(sql).format(**variables)
    conn = psycopg.connect(f"service={pg_service}")
    cursor = conn.cursor()
    cursor.execute(sql)
    conn.commit()
    conn.close()


def create_app(
    srid: int = 2056,
    pg_service: str = "pg_tdh",
    drop_schema: Optional[bool] = False,
    #    tdh_xxx_extra: Optional[Path] = None,
    #    if several tdh_xx_extra add a line for each view
):
    """
    Creates the schema tdh_app for TEKSI Distance Heating
    :param srid: the EPSG code for geometry columns
    :param drop_schema: will drop schema tdh_app if it exists
    :param pg_service: the PostgreSQL service, if not given it will be determined from environment variable in Pirogue
    """

    #    :param tdh_xxx_extra: YAML file path of the definition of additional columns for vw_tdh_xxx view

    Path(__file__).parent.resolve()
    variables = {
        "SRID": psycopg.sql.SQL(f"{srid}")
    }  # when dropping psycopg2 support, we can use the srid var directly

    if drop_schema:
        run_sql("DROP SCHEMA IF EXISTS tdh_app CASCADE;", pg_service)

    run_sql("CREATE SCHEMA tdh_app;", pg_service)

    # to do add symbology_function and geometry_funcions for TEKSI Distance heating

    #    run_sql_file("symbology_functions.sql", pg_service)
    #    run_sql_file("14_geometry_functions.sql", pg_service, variables)

    # open YAML files
    #    if tdh_xx_extra:
    #        tdh_xx_extra = safe_load(open(tdh_xx_extra))

    run_sql_file("view/vw_dictionary_value_list.sql", pg_service, variables)

    defaults = {"view_schema": "tdh_app", "pg_service": pg_service}

    SingleInheritances = {
        # subclasse of pipe_point (Leitungspunkt)
        "pipe_point_normal": "pipe_point",
        "pipe_point_feed": "pipe_point",
    }

    for key in SingleInheritances:
        SingleInheritance(
            "tdh_od." + SingleInheritances[key],
            "tdh_od." + key,
            view_name="vw_" + key,
            pkey_default_value=True,
            inner_defaults={"identifier": "obj_id"},
            **defaults,
        ).create()

    # MultipleInheritance configuration - add  a block for each MultipleInheritance

    # MultipleInheritance(
    # safe_load(open(cwd / "view/vw_maintenance_event.yaml")),
    # create_joins=True,
    # drop=True,
    # variables=variables,
    # pg_service=pg_service,
    # ).create()

    # MultipleInheritance(
    # safe_load(open(cwd / "view/vw_damage.yaml")),
    # drop=True,
    # pg_service=pg_service,
    # ).create()

    # vw_tdh_xxx(
    # srid, pg_service=pg_service, extra_definition=tdh_xxx_extra
    # )

    # additional views to be created with simple sql

    # run_sql_file("view/vw_file.sql", pg_service, variables)

    # MultipleInheritance(
    # safe_load(open(cwd / "view/vw_oo_overflow.yaml")),
    # create_joins=True,
    # variables=variables,
    # pg_service=pg_service,
    # drop=True,
    # ).create()

    # Recreate network views
    # run_sql_file("view/network/vw_network_node.sql", pg_service, variables)
    # run_sql_file("view/network/vw_network_segment.sql", pg_service, variables)

    # Recreate extension views
    # to do add extensions if necessary
    # run_sql_file("swmm_views/02_vw_swmm_junctions.sql", pg_service, variables)

    # SimpleJoins configuration - add  a block for each SimpleJoins

    # SimpleJoins(safe_load(open(cwd / "view/export/vw_export_reach.yaml")), pg_service).create()
    # SimpleJoins(
    # safe_load(open(cwd / "view/export/vw_export_xxx_structure.yaml")),
    # pg_service,
    # ).create()

    # run_sql_file("triggers/network.sql", pg_service)

    run_sql_file("tdh_app_roles.sql", pg_service, variables)


if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("-p", "--pg_service", help="postgres service")
    parser.add_argument(
        "-s", "--srid", help="SRID EPSG code, defaults to 2056", type=int, default=2056
    )
    # parser.add_argument(
    # "--tdh_wastewater_structure_extra",
    # help="YAML definition file path for additions to vw_tdh_xxx_structure view",
    # )
    # parser.add_argument(
    # "--tdh_reach_extra",
    # help="YAML definition file path for additions to vw_tdh_reach view",
    # )
    parser.add_argument(
        "-d",
        "--drop-schema",
        help="Drops cascaded any existing tdh_app schema",
        default=False,
        action=BooleanOptionalAction,
    )
    args = parser.parse_args()

    create_app(
        args.srid,
        args.pg_service,
        drop_schema=args.drop_schema,
        # tdh_reach_extra=args.tdh_reach_extra,
        # tdh_xxx_structure_extra=args.tdh_wastewater_structure_extra,
    )
