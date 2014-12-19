# 3.17
FROM ubuntu:vivid

ENV KVER 3.17
RUN apt-get update  && apt-get -y -q upgrade  && apt-get -y -q install libncurses-dev wget xz-utils build-essential  && apt-get clean
RUN mkdir -p /usr/src/  && wget -q https://kernel.org/pub/linux/kernel/v3.x/linux-$KVER.tar.xz -O - | tar -C /usr/src/ -xJf -  && ln -s /usr/src/linux-$KVER /usr/src/linux
WORKDIR /usr/src/linux

# cross-armhf specific
# RUN dpkg --add-architecture armhf
RUN apt-get -y -q install u-boot-tools gcc-arm-linux-gnueabihf
ENV ARCH arm
ENV CROSS_COMPILE arm-linux-gnueabihf-
