#!/usr/bin/env bash

set -e

# load env vars
# https://stackoverflow.com/a/20909045/1548052
export $(grep -v '^#' .env | xargs)

BUILD=0
DEMO_DATA=0
TDH_PG_PORT=${TDH_PG_PORT:-5432}

while getopts 'bdp:' opt; do
  case "$opt" in
    b)
      echo "Rebuild docker image"
      BUILD=1
      ;;

    d)
      echo "Load demo data"
      DEMO_DATA=1
      ;;

    p)
      echo "Overriding PG port to ${OPTARG}"
      tdh_PG_PORT=${OPTARG}
      ;;


    ?|h)
      echo "Usage: $(basename $0) [-bd] [-p PG_PORT]"
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"

if [[ $BUILD -eq 1 ]]; then
  docker build --build-arg RUN_TEST=True -f datamodel/.docker/Dockerfile --tag teksi/district_heating .
fi

docker rm -f teksi-district_heating
docker run -d -p ${tdh_PG_PORT}:5432 -v $(pwd):/src  --name teksi-district_heating teksi/district_heating -c log_statement=all
docker exec teksi-district_heating run-pum.sh wait
if [[ $DEMO_DATA -eq 1 ]]; then
  docker exec teksi-district_heating run-pum.sh build -d
fi
