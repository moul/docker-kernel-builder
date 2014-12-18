# 3.10
FROM ubuntu:latest

ENV KVER 3.10
RUN apt-get update && apt-get -y -q upgrade && apt-get -y -q install wget && apt-get clean
RUN mkdir -p /usr/src/linux && wget -q https://kernel.org/pub/linux/kernel/v3.x/linux-$KVER.tar.xz | tar -C /usr/src/linux/ -xf -
WORKDIR /usr/src/linux

# cross-arm specific
RUN apt-get -y -q install gcc-arm-none-eabi
ENV ARCH arm
