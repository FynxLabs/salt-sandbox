FROM ubuntu:16.04
MAINTAINER FynxLabs <levi@fynx.me>

RUN set -ex &&\
    apt-get update &&\
    apt-get install wget -y &&\
    wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -  &&\
    echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" > /etc/apt/sources.list.d/saltstack.list &&\
    apt-get update &&\
    apt-get install salt-master -y &&\
    apt-get remove -y wget &&\
    apt-get autoremove -y &&\
    rm -rf /var/lib/apt/lists/*

VOLUME /var/cache/salt      \
       /var/log/salt        \
       /etc/salt/pki        \
       /etc/salt/master.d   \
       /srv/salt

EXPOSE 4505 4506

COPY master /etc/salt/master
COPY entrypoint.sh /entrypoint.sh

CMD ["entrypoint.sh"]
