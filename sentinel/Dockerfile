FROM joshula/redis-sentinel

ENV V_GIDDYUP 0.17.1
RUN curl -s -o /usr/local/bin/giddyup https://github.com/rancher/giddyup/releases/download/v${V_GIDDYUP}/giddyup && \
  chmod 755 /usr/local/bin/giddyup

ADD sentinel.conf /etc/redis/sentinel.conf

COPY  start-sentinel.sh /start-sentinel.sh
RUN chmod 755 /start-sentinel.sh
ENTRYPOINT [ "/start-sentinel.sh"]
