# 3.2
FROM ubuntu:vivid

ENV KVER 3.2
RUN apt-get update  && apt-get -y -q upgrade  && apt-get -y -q install libncurses-dev wget xz-utils build-essential  && apt-get clean
RUN mkdir -p /usr/src/  && wget -q https://kernel.org/pub/linux/kernel/v3.x/linux-$KVER.tar.xz -O - | tar -C /usr/src/ -xJf -  && ln -s /usr/src/linux-$KVER /usr/src/linux
WORKDIR /usr/src/linux

# cross-armhf specific
RUN apt-get -y -q install gcc-4.9-arm-linux-gnueabihf u-boot-tools
ENV ARCH arm
ENV CROSS_COMPILE arm-linux-gnueabihf-
