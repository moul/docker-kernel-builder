FROM ubuntu:xenial
MAINTAINER Manfred Touron (@moul)


# Install dependencies
RUN apt-get update               \
 && apt-get -y -q upgrade        \
 && apt-get -y -q install        \
    bc                           \
    binutils-arm-linux-gnueabihf \
    build-essential              \
    ccache                       \
    gcc-arm-linux-gnueabihf      \
    gccgo-4.7-arm-linux-gnueabi  \
    gcc-aarch64-linux-gnu        \
    git                          \
    libncurses-dev               \
    libssl-dev                   \
    u-boot-tools                 \
    wget                         \
    xz-utils                     \
 && apt-get clean


# Install DTC
RUN wget http://ftp.fr.debian.org/debian/pool/main/d/device-tree-compiler/device-tree-compiler_1.4.0+dfsg-1_amd64.deb -O /tmp/dtc.deb \
 && dpkg -i /tmp/dtc.deb \
 && rm -f /tmp/dtc.deb


# Fetch the kernel
ENV KVER=stable              \
    CCACHE_DIR=/ccache       \
    SRC_DIR=/usr/src         \
    DIST_DIR=/dist           \
    LINUX_DIR=/usr/src/linux \
    LINUX_REPO_URL=git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
RUN mkdir -p ${SRC_DIR} ${CCACHE_DIR} ${DIST_DIR}  \
 && cd /usr/src                                    \
 && git clone ${LINUX_REPO_URL}                    \
 && ln -s ${SRC_DIR}/linux-${KVER} ${LINUX_DIR}
WORKDIR ${LINUX_DIR}


# Update git tree
RUN git fetch --tags
