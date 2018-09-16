# Dockerfile for uipath-dashboard
#
# Run with:
# docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 -it . 

FROM sebp/elk:640

MAINTAINER Rune Norderhaug

COPY ./src/logstash.conf /etc/logstash/conf.d/03-uipath.conf
COPY ./src/pre-hooks.sh /usr/local/bin/elk-pre-hooks.sh
COPY ./src/post-hooks.sh /usr/local/bin/elk-post-hooks.sh

COPY ./logs /usr/home/logs
COPY ./dashboard /usr/home/dashboard

ENV MAX_MAP_COUNT 262144
ENV ES_CONNECT_RETRY 120
ENV KIBANA_CONNECT_RETRY 120
