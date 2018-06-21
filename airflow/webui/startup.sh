#!/bin/bash

mkdir -p $AIRFLOW_DAG
mkdir -p $AIRFLOW_LOG

airflow initdb && airflow webserver