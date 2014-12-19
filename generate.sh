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
 && apt-get -y -q install libncurses-dev wget xz-utils \
 && apt-get clean
RUN mkdir -p /usr/src/ \
 && wget -q https://kernel.org/pub/linux/kernel/v3.x/linux-\$KVER.tar.xz -O - | tar -C /usr/src/ -xJf - \
 && ln -s /usr/src/linux-\$KVER /usr/src/linux
WORKDIR /usr/src/linux
EOF

    mkdir -p ${version}-cross-arm
    cp ${version}/Dockerfile ${version}-cross-arm/Dockerfile
    cat <<EOF >> ${version}-cross-arm/Dockerfile

# cross-arm specific
RUN apt-get -y -q install gcc-arm-none-eabi
ENV ARCH arm
EOF

done
