#!/bin/bash

mkdir -p $AIRFLOW_DAG
mkdir -p $AIRFLOW_LOG

chown -R airflow:airflow $AIRFLOW_DAG
chown -R airflow:airflow $AIRFLOW_LOG

case "$1" in
  webserver)
    airflow initdb
    exec airflow webserver
    ;;
  worker|scheduler)
    # To give the webserver time to run initdb.
    sleep 10
    exec airflow "$@"
    ;;
  flower)
    exec airflow "$@"
    ;;
  version)
    exec airflow "$@"
    ;;
  *)
    # The command is something like bash, not an airflow subcommand. Just run it in the right environment.
    exec "$@"
    ;;
esac