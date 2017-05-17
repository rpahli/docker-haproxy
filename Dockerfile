FROM ubuntu:16.04
MAINTAINER  rico.pahlisch@goolemail.com

RUN apt-get update && apt-get install -y libnl-utils iproute iptables supervisor haproxy && apt-get clean
RUN mkdir /programs
RUN mkdir /conf

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY haproxy.sh /programs/haproxy.sh
COPY docker-entrypoint.sh /programs/docker-entrypoint.sh

VOLUME /tmp

EXPOSE 22 80 443
CMD ["/programs/docker-entrypoint.sh"]
