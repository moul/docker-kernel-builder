FROM moul/kernel-builder:base

# Update git tree
RUN git fetch --tags

# Example envs:
# i386:   n/a
# x86_64  n/a
# armhf:  ENV ARCH=arm CROSS_COMPILE="ccache arm-linux-gnueabihf-"
# arm:    ENV ARCH=arm CROSS_COMPILE="ccache arm-linux-gnueabi-"
# arm64:  ENV ARCH=arm64 CROSS_COMPILE="ccache aarch64-linux-gnu-"
