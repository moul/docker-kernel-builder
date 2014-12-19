# 3.17
FROM ubuntu:vivid

ENV KVER 3.17
RUN apt-get update  && apt-get -y -q upgrade  && apt-get -y -q install libncurses-dev wget xz-utils  && apt-get clean
RUN mkdir -p /usr/src/linux  && wget -q https://kernel.org/pub/linux/kernel/v3.x/linux-$KVER.tar.xz -O - | tar -C /usr/src/linux/ -xf -
WORKDIR /usr/src/linux

# cross-arm specific
RUN apt-get -y -q install gcc-arm-none-eabi
ENV ARCH arm
