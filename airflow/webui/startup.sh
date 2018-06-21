#!/bin/bash

mkdir -p $AIRFLOW_DAG
mkdir -p $AIRFLOW_LOG

airflow webserver -p 9090