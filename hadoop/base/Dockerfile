FROM  bigdata-baseimg:0.3

LABEL Description="This is a base image for Hadoop Cluster Nodes" \
      Author="Pavan Keerthi <pavan.keerthi@gmail.com>"

ENV HADOOP_VERSION 3.1.1
ENV HADOOP_URL https://dist.apache.org/repos/dist/release/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
ENV HADOOP_KEYS_URL https://dist.apache.org/repos/dist/release/hadoop/common/KEYS

RUN set -x \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
    && curl -fSL "$HADOOP_KEYS_URL" -o /tmp/hadoop_KEYS \
    && gpg --import /tmp/hadoop_KEYS \
    && gpg --verify /tmp/hadoop.tar.gz.asc \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*



RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop

RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs
RUN mkdir /hadoop-data

ENV HADOOP_PREFIX=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV PATH $HADOOP_PREFIX/bin/:$PATH


ENV AZURE_STORAGE_JAR=azure-storage-7.0.0.jar
ENV AZURE_DATALAKE_JAR=azure-data-lake-store-sdk-2.2.7.jar
ENV AZURE_KEYVAULT_JAR=azure-keyvault-core-1.0.0.jar


ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/hadoop-$HADOOP_VERSION/share/hadoop/tools/lib/hadoop-azure-$HADOOP_VERSION.jar:/opt/hadoop-$HADOOP_VERSION/share/hadoop/tools/lib/hadoop-azure-datalake-$HADOOP_VERSION.jar
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/opt/hadoop-$HADOOP_VERSION/share/hadoop/tools/lib/$AZURE_STORAGE_JAR:/opt/hadoop-$HADOOP_VERSION/share/hadoop/tools/lib/AZURE_DATALAKE_JAR:/opt/hadoop-$HADOOP_VERSION/share/hadoop/tools/lib/$AZURE_KEYVAULT_JAR



ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
