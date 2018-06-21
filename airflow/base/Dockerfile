FROM  bigdata-baseimg:0.2

LABEL Description="Base Image for Airflow Nodes" \
      Author="Pavan Keerthi <pavan.keerthi@gmail.com>"

	  
# Airflow
ARG AIRFLOW_VERSION=1.9.0
ARG AIRFLOW_HOME=~/airflow

ENV AIRFLOW_DAG=~/airflow/dags
ENV AIRFLOW_LOG=~/airflow/logs
	  
	  
# Install Python Modules
RUN python3.6 -m pip install -U setuptools
RUN python3.6 -m pip install celery[redis]==4.1.1
RUN python3.6 -m pip install apache-airflow[async,crypto,celery,postgres,redis]==$AIRFLOW_VERSION
RUN python3.6 -m pip install psycopg2-binary
RUN python3.6 -m pip install SQLAlchemy

COPY airflow.cfg ~/airflow/airflow.cfg