# 3.18
FROM ubuntu:vivid

# Install dependencies
RUN apt-get update  && apt-get -y -q upgrade  && apt-get -y -q install libncurses-dev wget xz-utils build-essential bc ccache  && apt-get clean

# Fetch the kernel
ENV KVER 3.18
RUN mkdir -p /usr/src/  && wget -q https://kernel.org/pub/linux/kernel/v3.x/linux-$KVER.tar.xz -O - | tar -C /usr/src/ -xJf -  && ln -s /usr/src/linux-$KVER /usr/src/linux  && ln -s /usr/src/linux /usr/src/linux  && mkdir -p /dist
WORKDIR /usr/src/linux

# Ccache
ENV CCACHE_DIR /ccache
#ENV CC ccache gcc
#ENV CXX ccache g++
#ENV PATH /usr/lib/ccache:/usr/local/bin:/usr/local/sbin::/Users/moul/mbin:/Users/moul/mbin2:/Users/moul/node_modules/.bin/usr/local/share/npm/bin:/bin:/sbin:/usr/bin:/usr/sbin:/Users/moul/go/bin/
RUN mkdir -p /ccache


# ARMEL specifics
RUN apt-get -y -q install gccgo-4.7-arm-linux-gnueabi u-boot-tools

ENV ARCH arm
ENV CROSS_COMPILE ccache arm-linux-gnueabi-
