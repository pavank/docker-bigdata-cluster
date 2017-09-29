FROM spark-base:0.2

LABEL Description="This is spark worker node" \
      Author="Pavan Keerthi <pavana.keerthi@gmail.com" 

HEALTHCHECK CMD curl -f http://localhost:8081/ || exit 1

WORKDIR $SPARK_HOME

COPY worker.sh $SPARK_HOME
RUN chmod +x $SPARK_HOME/worker.sh

ENV SPARK_WORKER_WEBUI_PORT 8081
ENV SPARK_WORKER_LOG  /var/log/spark-worker

EXPOSE 8081

CMD ["./worker.sh"]
