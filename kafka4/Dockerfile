ARG KAFKA_VERSION
FROM docker.io/apache/kafka:${KAFKA_VERSION}
LABEL MAINTAINER Justin Zhang "schnell18@gmail.com"

# switch back to root to ease file sharing between container and host
USER root

# change server.properties location to /etc/kafka/config
RUN sed -i 's#/opt/kafka/config/server.properties#/etc/kafka/config/server.properties#' /etc/kafka/docker/launch
