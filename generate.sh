#!/bin/bash

VERSIONS="3.2 3.10 3.17 3.18"

for version in $VERSIONS; do
    mkdir -p ${version}
    cat <<EOF > ${version}/Dockerfile
# ${version}
FROM ubuntu:vivid

ENV KVER ${version}
RUN apt-get update \
 && apt-get -y -q upgrade \
 && apt-get -y -q install libncurses-dev wget xz-utils build-essential \
 && apt-get clean
RUN mkdir -p /usr/src/ \
 && wget -q https://kernel.org/pub/linux/kernel/v3.x/linux-\$KVER.tar.xz -O - | tar -C /usr/src/ -xJf - \
 && ln -s /usr/src/linux-\$KVER /usr/src/linux
WORKDIR /usr/src/linux
EOF

    mkdir -p ${version}-cross-armhf
    cp ${version}/Dockerfile ${version}-cross-armhf/Dockerfile
    cat <<EOF >> ${version}-cross-armhf/Dockerfile

# cross-armhf specific
RUN apt-get -y -q install gcc-4.9-arm-linux-gnueabihf u-boot-tools
ENV ARCH arm
ENV CROSS_COMPILE arm-linux-gnueabihf-
EOF

    mkdir -p ${version}-cross-armel
    cp ${version}/Dockerfile ${version}-cross-armel/Dockerfile
    cat <<EOF >> ${version}-cross-armel/Dockerfile

# cross-armel specific
RUN apt-get -y -q install gccgo-4.7-arm-linux-gnueabi u-boot-tools
ENV ARCH arm
ENV CROSS_COMPILE arm-linux-gnueabi-
EOF

done
