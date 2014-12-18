FROM ubuntu:latest

ENV KVER 3.17
RUN apt-get update && apt-get -y -q upgrade && apt-get clean
RUN mkdir -p /usr/src/linux && wget -q https://kernel.org/pub/linux/kernel/v3.x/linux-.tar.xz | tar -C /usr/src/linux/ -xf -
WORKDIR /usr/src/linux
