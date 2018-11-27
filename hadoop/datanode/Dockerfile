FROM  hadoop-base:0.3
LABEL Description="This is the data node for Hadoop Cluster" \
      Author="Pavan Keerthi <pavan.keerthi@gmail.com>"

HEALTHCHECK CMD curl -f http://localhost:50075/ || exit 1

ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data
RUN mkdir -p /hadoop/dfs/data
VOLUME /hadoop/dfs/data

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 50075

CMD ["/run.sh"]
