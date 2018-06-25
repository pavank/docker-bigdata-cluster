#!/bin/bash

set -eo pipefail

# Run once, hold otherwise
if [ -f "already_ran" ]; then
    echo "Already ran the Entrypoint once. Holding indefinitely for debugging."
    cat
fi
touch already_ran

# Do your main things down here
mkdir -p $AIRFLOW_DAG
mkdir -p $AIRFLOW_LOG

if [ "$1" = 'webserver' ]; then
    airflow initdb && airflow webserver
fi
exec "$@"