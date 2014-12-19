# 3.10
FROM ubuntu:vivid

# Install dependencies
RUN apt-get update  && apt-get -y -q upgrade  && apt-get -y -q install libncurses-dev wget xz-utils build-essential bc ccache  && apt-get clean

# Fetch the kernel
ENV KVER 3.10
RUN mkdir -p /usr/src/  && wget -q https://kernel.org/pub/linux/kernel/v3.x/linux-$KVER.tar.xz -O - | tar -C /usr/src/ -xJf -  && ln -s /usr/src/linux-$KVER /usr/src/linux  && ln -s /usr/src/linux /usr/src/linux  && mkdir -p /dist
WORKDIR /usr/src/linux
