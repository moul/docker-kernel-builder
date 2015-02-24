# stable
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get -y -q upgrade && apt-get -y -q install libncurses-dev wget xz-utils build-essential bc ccache git && apt-get clean

# Fetch the kernel
ENV KVER stable
RUN mkdir -p /usr/src && cd /usr/src && git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git && ln -s /usr/src/linux-$KVER /usr/src/linux && mkdir -p /dist
WORKDIR /usr/src/linux

# Ccache
ENV CCACHE_DIR /ccache
RUN mkdir -p /ccache

# ARMEL specifics
RUN apt-get -y -q install gccgo-4.7-arm-linux-gnueabi u-boot-tools

ENV ARCH arm
ENV CROSS_COMPILE ccache arm-linux-gnueabi-
