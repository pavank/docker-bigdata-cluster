FROM hadoop-base:0.3

LABEL Description="This is historyserver node for Hadoop Cluster" \
      Author="Pavan Keerthi<pavan.keerthi@gmail.com>"

HEALTHCHECK CMD curl -f http://localhost:8188/ || exit 1

ENV YARN_CONF_yarn_timeline___service_leveldb___timeline___store_path=/hadoop/yarn/timeline

RUN mkdir -p /hadoop/yarn/timeline
VOLUME /hadoop/yarn/timeline

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8188

CMD ["/run.sh"]
