FROM redis

LABEL Description="This is the redis DB used for bigdata cluster frameworks;E.g:Celery Backend etc.." \
      Author="Pavan Keerthi <pavan.keerthi@gmail.com>"

COPY healthcheck /usr/local/bin/
RUN chmod +x /usr/local/bin/healthcheck.sh


HEALTHCHECK CMD ["healthcheck"]