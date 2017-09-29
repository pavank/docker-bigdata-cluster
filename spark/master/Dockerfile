FROM spark-base:0.2

LABEL Description="This is spark master node" \
      Author="Pavan Keerthi <pavana.keerthi@gmail.com" 

HEALTHCHECK CMD curl -f http://localhost:8080/ || exit 1

WORKDIR $SPARK_HOME

COPY master.sh $SPARK_HOME
RUN chmod +x $SPARK_HOME/master.sh

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_MASTER_LOG  /var/log/spark-master

EXPOSE 8080
EXPOSE 7077
EXPOSE 6066

CMD ["./master.sh"]
