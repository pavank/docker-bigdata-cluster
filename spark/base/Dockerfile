FROM bigdata-baseimg:0.2

LABEL Description="This is a base image for Spark Nodes" \
      Author="Pavan Keerthi <pavan.keerthi@gmail.com>"

RUN gpg --keyserver pool.sks-keyservers.net --recv-keys \
	A864F0C3E5262F9A229B85D07B165D2A15E06093 \
	3E1CBD0F0533D602E80C6E986B32946082667DC1 \
	9555DAB91FFA8A15D0925B87B1A91F0000799F7E \
	67B2C95165D2E87617433C3C5D951CFF87FD1A97 \
	5AA90E72812FF2467904277D548F5FEE9E4FE3AF \
        FC8ED089 

ENV SPARK_VERSION spark-2.2.0-bin-hadoop2.7
ENV SPARK_URL https://www.apache.org/dist/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz

RUN set -x \
    && curl -fSL "$SPARK_URL" -o /tmp/spark.tar.gz \
    && curl -fSL "$SPARK_URL.asc" -o /tmp/spark.tar.gz.asc \
    && gpg --verify /tmp/spark.tar.gz.asc \
    && tar -xvzf /tmp/spark.tar.gz -C /opt/ \
    && rm /tmp/spark.tar.gz*

ENV SPARK_HOME=/opt/$SPARK_VERSION
ENV PATH $SPARK_HOME/bin:$PATH


COPY hive-site.xml $SPARK_HOME/conf/
COPY core-site.xml $SPARK_HOME/conf/
COPY yarn-site.xml $SPARK_HOME/conf/

ENV HADOOP_CONF_DIR=$SPARK_HOME/conf


COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENV PYSPARK_PYTHON=python3.6
ENV PYTHONHASHSEED 1

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
