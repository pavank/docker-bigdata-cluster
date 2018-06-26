FROM  bigdata-baseimg:0.2

LABEL Description="Base Image for Airflow Nodes" \
      Author="Pavan Keerthi <pavan.keerthi@gmail.com>"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        rsync \
        locales \
    && sed -i 's/^# en_US.UTF-8 UTF-8$/en_US.UTF-8 UTF-8/g' /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 


# Define en_US.
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LC_MESSAGES en_US.UTF-8
	  
# Airflow Config
ARG AIRFLOW_VERSION=1.9.0

ENV AIRFLOW_HOME=/usr/local/airflow
ENV AIRFLOW_DAG=${AIRFLOW_HOME}/dags
ENV AIRFLOW_LOG=${AIRFLOW_HOME}/logs


# Install Python Modules
RUN python3.6 -m pip install -U setuptools
RUN python3.6 -m pip install celery[redis]==4.1.1
RUN python3.6 -m pip install apache-airflow[async,crypto,celery,postgres,redis]==$AIRFLOW_VERSION
RUN python3.6 -m pip install psycopg2-binary
RUN python3.6 -m pip install SQLAlchemy
RUN python3.6 -m pip install pyOpenSSL 
RUN python3.6 -m pip install ndg-httpsclient
RUN python3.6 -m pip install pyasn1


#Airflow Setup
RUN useradd -ms /bin/bash -d ${AIRFLOW_HOME} airflow
COPY airflow.cfg ${AIRFLOW_HOME}/airflow.cfg
RUN chown -R airflow: ${AIRFLOW_HOME}