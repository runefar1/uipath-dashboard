FROM sebp/elk:640

COPY ./src/logstash.conf /etc/logstash/conf.d/03-uipath.conf
COPY ./src/pre-hooks.sh /usr/local/bin/elk-pre-hooks.sh
COPY ./src/post-hooks.sh /usr/local/bin/elk-post-hooks.sh
