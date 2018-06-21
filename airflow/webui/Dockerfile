FROM  airflow-base:0.2 

LABEL Description="This is a Apache Airflow WebUI node" \
      Author="Pavan Keerthi <pavan.keerthi@gmail.com>"

COPY startup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startup.sh

EXPOSE 9090

CMD startup.sh
