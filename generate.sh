#!/bin/bash

VERSIONS="3.2 3.10 3.17 3.18"

for version in $VERSIONS; do
    mkdir -p ${version}
    cat <<EOF > ${version}/Dockerfile
# ${version}
FROM ubuntu:latest

ENV KVER ${version}
RUN apt-get update && apt-get -y -q upgrade && apt-get -y -q install wget && apt-get clean
RUN mkdir -p /usr/src/linux && wget -q https://kernel.org/pub/linux/kernel/v3.x/linux-\$KVER.tar.xz | tar -C /usr/src/linux/ -xf -
WORKDIR /usr/src/linux
EOF

    mkdir -p ${version}-cross-arm
    cat <<EOF > ${version}-cross-arm/Dockerfile
# ${version}
FROM ubuntu:latest

ENV KVER $version
RUN apt-get update && apt-get -y -q upgrade && apt-get -y -q install wget && apt-get clean
RUN mkdir -p /usr/src/linux && wget -q https://kernel.org/pub/linux/kernel/v3.x/linux-\$KVER.tar.xz | tar -C /usr/src/linux/ -xf -
WORKDIR /usr/src/linux

# cross-arm specific
RUN apt-get -y -q install gcc-arm-none-eabi
ENV ARCH arm
EOF

done
