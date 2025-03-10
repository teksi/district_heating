#!/bin/bash
#!/usr/bin/env python

# This script will create a clean datastructure for the
# TEKSI Distant heating
# based on the Distant heating datamodel (see https://405.sia.ch/models/2015/)
# It will create new schemats tdh_* in a postgres database.

set -e

PGSERVICE=${PGSERVICE:-pg_tdh}
SRID=2056

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/..

cd $DIR
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/changelogs/0001/00_db_extensions.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/changelogs/0001/01_schema.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/changelogs/0001/02_sys.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/changelogs/0001/oid_generation.sql

psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/changelogs/0001/03_tdh_db_organisation.sql

psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/changelogs/0001/03_tdh_db_sia405.sql -v SRID=$SRID

# Add control cable (Fernwirkkabel)
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/changelogs/0001/03_tdh_control_cable_db_sia405.sql -v SRID=$SRID

# Add Protection tube (Schutzrohr)
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/changelogs/0001/03_tdh_protection_tube_db_sia405.sql -v SRID=$SRID

# Add document management
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/changelogs/0001/04_tdh_db_data_media_file.sql

# psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/changelogs/0001/05_data_model_extensions.sql

psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/changelogs/0001/09_tdh_dictionaries.sql -v SRID=$SRID

psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/changelogs/0001/09_tdh_data_media_file_dictionaries.sql

psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/changelogs/0001/09_tdh_organisation_dictionaries.sql -v SRID=$SRID

psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/changelogs/0001/09_tdh_control_cable_dictionaries.sql -v SRID=$SRID

psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/changelogs/0001/09_tdh_protection_tube_dictionaries.sql -v SRID=$SRID

#psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/changelogs/0001/13_import.sql -v SRID=$SRID


# psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/app/symbology_functions.sql
# psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/app/14_geometry_functions.sql -v SRID=$SRID

# psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/app/triggers/network.sql


psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/12_0_roles.sql
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/12_1_roles.sql

#Set default values table
psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f ${DIR}/changelogs/0001/14_default_values.sql

${DIR}/app/create_app.py --pg_service ${PGSERVICE} --srid ${SRID}
