FROM ubuntu:14.04

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y software-properties-common
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
RUN add-apt-repository "deb http://dl.hhvm.com/ubuntu $(lsb_release -sc) main"
RUN apt-get update
RUN apt-get install -y hhvm

WORKDIR /srv

CMD hhvm --mode server -vServer.Type=fastcgi -vServer.Port=9000
