# 3.10-mvebu
FROM ubuntu:vivid

# Install dependencies
RUN apt-get update  && apt-get -y -q upgrade  && apt-get -y -q install libncurses-dev wget xz-utils build-essential bc ccache unzip && apt-get clean

# Fetch the kernel
ENV KVER 3.10
RUN mkdir -p /usr/src/ && wget -q https://github.com/MISL-EBU-System-SW/mainline-public/archive/backport-$KVER.zip -O /tmp/$KVER.zip && unzip /tmp/$KVER.zip -d /usr/src/ && ln -s /usr/src/mainline-public-backport-$KVER /usr/src/linux  && mkdir -p /dist && rm -f /tmp/$KVER.zip
WORKDIR /usr/src/linux

# Ccache
ENV CCACHE_DIR /ccache
#ENV CC ccache gcc
#ENV CXX ccache g++
#ENV PATH /usr/lib/ccache:/usr/local/bin:/usr/local/sbin::/Users/moul/mbin:/Users/moul/mbin2:/Users/moul/node_modules/.bin/usr/local/share/npm/bin:/bin:/sbin:/usr/bin:/usr/sbin:/Users/moul/go/bin/
RUN mkdir -p /ccache

# ARMHF specifics
# RUN dpkg --add-architecture armhf
RUN apt-get -y -q install u-boot-tools gcc-arm-linux-gnueabihf binutils-arm-linux-gnueabihf
ENV ARCH arm
ENV CROSS_COMPILE ccache arm-linux-gnueabihf-
