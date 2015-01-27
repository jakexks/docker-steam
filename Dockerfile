FROM debian:jessie
MAINTAINER Jake Sanders <i@am.so-aweso.me>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install curl sudo lib32gcc1 && apt-get -qyy clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN adduser steam
RUN mkdir /opt/steamcmd && curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -zxvf - -C /opt/steamcmd && chown -R steam:steam /opt/steamcmd

USER steam
WORKDIR /home/steam

ENTRYPOINT ["/bin/bash", "/opt/steamcmd/steamcmd.sh"]
