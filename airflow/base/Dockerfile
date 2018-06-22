FROM  bigdata-baseimg:0.2

LABEL Description="Base Image for Airflow Nodes" \
      Author="Pavan Keerthi <pavan.keerthi@gmail.com>"

	  
# Airflow
ARG AIRFLOW_VERSION=1.9.0
ARG AIRFLOW_HOME=/root/airflow

ENV AIRFLOW_DAG=/root/airflow/dags
ENV AIRFLOW_LOG=/root/airflow/logs


# Install Python Modules
RUN python3.6 -m pip install -U setuptools
RUN python3.6 -m pip install celery[redis]==4.1.1
RUN python3.6 -m pip install apache-airflow[async,crypto,celery,postgres,redis]==$AIRFLOW_VERSION
RUN python3.6 -m pip install psycopg2-binary
RUN python3.6 -m pip install SQLAlchemy


#Create airflow Linux User
RUN useradd -s /bin/bash -g root -G sudo -p airflow airflow


#Config
COPY airflow.cfg  /root/airflow/airflow.cfg