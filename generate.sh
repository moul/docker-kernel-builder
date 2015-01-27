#!/bin/bash

VERSIONS="3.2 3.10 3.14 3.17 3.18"

for version in $VERSIONS; do
    mkdir -p ${version}
    cat <<EOF > ${version}/Dockerfile
# ${version}
FROM ubuntu:vivid

# Install dependencies
RUN apt-get update \
 && apt-get -y -q upgrade \
 && apt-get -y -q install libncurses-dev wget xz-utils build-essential bc ccache git \
 && apt-get clean

RUN wget http://ftp.fr.debian.org/debian/pool/main/d/device-tree-compiler/device-tree-compiler_1.4.0+dfsg-1_amd64.deb -O /tmp/dtb.deb \
 && dpkg -i /tmp/dtb.deb \
 && rm -f /tmp/dtb.deb

# Fetch the kernel
ENV KVER ${version}
RUN mkdir -p /usr/src/ \
 && wget -q https://kernel.org/pub/linux/kernel/v3.x/linux-\$KVER.tar.xz -O - | tar -C /usr/src/ -xJf - \
 && ln -s /usr/src/linux-\$KVER /usr/src/linux \
 && ln -s /usr/src/linux /usr/src/linux \
 && mkdir -p /dist
WORKDIR /usr/src/linux

# Ccache
ENV CCACHE_DIR /ccache
#ENV CC ccache gcc
#ENV CXX ccache g++
#ENV PATH /usr/lib/ccache:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
RUN mkdir -p /ccache

EOF

    mkdir -p ${version}-cross-armhf
    cp ${version}/Dockerfile ${version}-cross-armhf/Dockerfile
    cat <<EOF >> ${version}-cross-armhf/Dockerfile

# ARMHF specifics
# RUN dpkg --add-architecture armhf
RUN apt-get -y -q install u-boot-tools gcc-arm-linux-gnueabihf binutils-arm-linux-gnueabihf
ENV ARCH arm
ENV CROSS_COMPILE ccache arm-linux-gnueabihf-
EOF

    mkdir -p ${version}-cross-armel
    cp ${version}/Dockerfile ${version}-cross-armel/Dockerfile
    cat <<EOF >> ${version}-cross-armel/Dockerfile

# ARMEL specifics
RUN apt-get -y -q install gccgo-4.7-arm-linux-gnueabi u-boot-tools

ENV ARCH arm
ENV CROSS_COMPILE ccache arm-linux-gnueabi-
EOF

done
