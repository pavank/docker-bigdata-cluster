#!/bin/bash

export SPARK_MASTER_HOST=`hostname`

. "./sbin/spark-config.sh"

. "./bin/load-spark-env.sh"

mkdir -p $SPARK_MASTER_LOG


./bin/spark-class org.apache.spark.deploy.master.Master \
    --host $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT >> $SPARK_MASTER_LOG/spark-master.out
