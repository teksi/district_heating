#!/usr/bin/env bash

set -e

INSTALL_DEPS=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --install-deps|-i)
      INSTALL_DEPS=1
      shift
      ;;
    *)
      shift
      ;;
  esac
done

source .venv/bin/activate

if [[ $INSTALL_DEPS -eq 1 ]]; then
  .venv/bin/python -m pip install --ignore-installed ~/dev/pum
  #.venv/bin/python -m pip install --ignore-installed ~/dev/pirogue
  pyenv rehash
fi

export PGSERVICE=pg_tdh

#psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f datamodel/roles/roles_drop.sql

psql -c "DROP DATABASE IF EXISTS tdh;" "service=pg_tdh dbname=postgres"
psql -c "CREATE DATABASE tdh;" "service=pg_tdh dbname=postgres"


psql -c "DROP SCHEMA IF EXISTS tdh_od CASCADE;\
DROP SCHEMA IF EXISTS tdh_sys CASCADE;\
DROP SCHEMA IF EXISTS tdh_vl CASCADE;\
DROP SCHEMA IF EXISTS tdh_cfg CASCADE;\
DROP SCHEMA IF EXISTS tdh_app CASCADE;\
DROP ROLE IF EXISTS tdh_viewer;\
DROP ROLE IF EXISTS tdh_user;\
DROP ROLE IF EXISTS tdh_manager;\
DROP ROLE IF EXISTS tdh_sysadmin;"


#psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f datamodel/roles/roles_create.sql
#psql "service=${PGSERVICE}" -v ON_ERROR_STOP=1 -f datamodel/roles/roles_grant.sql

pum -v -p pg_tdh -d datamodel install -p SRID 2056 --demo-data Morges-Demo

psql -c "DROP SCHEMA IF EXISTS tdh_od CASCADE;\
DROP SCHEMA IF EXISTS tdh_sys CASCADE;\
DROP SCHEMA IF EXISTS tdh_vl CASCADE;\
DROP SCHEMA IF EXISTS tdh_cfg CASCADE;\
DROP SCHEMA IF EXISTS tdh_app CASCADE;\

pum -v -p pg_tdh -d datamodel install -p SRID 2056 --demo-data Morges-Demo
