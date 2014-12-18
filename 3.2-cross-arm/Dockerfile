FROM ubuntu:latest

ENV KVER 3.2
RUN apt-get update && apt-get -y -q upgrade && apt-get clean
RUN mkdir -p /usr/src/linux && wget -q https://kernel.org/pub/linux/kernel/v3.x/linux-$KVER.tar.xz | tar -C /usr/src/linux/ -xf -
RUN apt-get -y -q install gcc-arm-none-eabi
ENV ARCH arm
WORKDIR /usr/src/linux
