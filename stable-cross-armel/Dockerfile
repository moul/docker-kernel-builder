# stable
FROM ubuntu:vivid

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
RUN apt-get update && apt-get -y -q upgrade && apt-get -y -q install gccgo-4.7-arm-linux-gnueabi u-boot-tools

ENV ARCH arm
ENV CROSS_COMPILE ccache arm-linux-gnueabi-

# Install DTC
RUN wget http://ftp.fr.debian.org/debian/pool/main/d/device-tree-compiler/device-tree-compiler_1.4.0+dfsg-1_amd64.deb -O /tmp/dtc.deb \
 && dpkg -i /tmp/dtc.deb \
 && rm -f /tmp/dtc.deb

# Update git tree
RUN git fetch --tags
