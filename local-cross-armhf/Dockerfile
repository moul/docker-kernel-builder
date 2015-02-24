# stable
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get -y -q upgrade && apt-get -y -q install libncurses-dev wget xz-utils build-essential bc ccache git && apt-get clean

# Fetch the kernel
ENV KVER stable
RUN mkdir -p /usr/src/linux/.git /dist && ln -s /usr/src/linux-$KVER /usr/src/linux
WORKDIR /usr/src/linux

# Ccache
ENV CCACHE_DIR /ccache
RUN mkdir -p /ccache

# ARMHF specifics
# RUN dpkg --add-architecture armhf
RUN apt-get -y -q install u-boot-tools gcc-arm-linux-gnueabihf binutils-arm-linux-gnueabihf
ENV ARCH arm
ENV CROSS_COMPILE ccache arm-linux-gnueabihf-
