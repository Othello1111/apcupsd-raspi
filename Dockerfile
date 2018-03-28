FROM arm32v7/debian:stretch-slim

LABEL maintainer="Clay Shekleton <clay@clayshekleton.com>"

ENV PIID 1
ENV APIURL http://URL/api/UpsHeartbeat

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y apcupsd curl \
    && rm -rf /var/lib/apt/lists/*

COPY apc-config/apcupsd /etc/default/apcupsd
COPY apc-config/apcupsd.conf /etc/apcupsd/apcupsd.conf
COPY ups_data_push.sh /usr/local/bin/ups_data_push.sh

ENTRYPOINT ["bash", "/usr/local/bin/ups_data_push.sh"]
