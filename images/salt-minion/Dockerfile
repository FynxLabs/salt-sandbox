FROM ubuntu:16.04
MAINTAINER FynxLabs <levi@fynx.me>

RUN apt-get update &&\
    apt-get install wget -y &&\
    wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -  &&\
    echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" > /etc/apt/sources.list.d/saltstack.list &&\
    apt-get update &&\
    apt-get install salt-minion -y &&\
    apt-get install -y python-pip &&\
    pip install docker-py &&\
    apt-get remove -y wget &&\
    apt-get autoremove -y &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /tmp/*

VOLUME /etc/salt/minion.d &&\
       /var/log/salt

COPY entrypoint.sh /entrypoint.sh

CMD ["entrypoint.sh"]
