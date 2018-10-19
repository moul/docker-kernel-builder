# docker-kernel-builder

[![GuardRails badge](https://badges.production.guardrails.io/moul/docker-kernel-builder.svg)](https://www.guardrails.io)

Kernel build environment in Docker

https://registry.hub.docker.com/u/moul/kernel-builder/

## Projects using docker-kernel-builder

- https://github.com/scaleway/kernel-tools
- https://github.com/moul/travis-docker/tree/master/uml-builder

## Examples

Checkout `v4.3` stable branch of the kernel and do a `make menuconfig`

```
docker run -it --rm -v $(pwd)/.config:/tmp/.config moul/kernel-builder \
	/bin/bash -xec ' \
		git fetch --tags && git checkout v3.19 && \
		cp /tmp/.config .config && \
		make oldconfig && \
		cp .config /tmp/.config \
	'
```

Checkout `v3.19` stable branch of the kernel and do a `make menuconfig` with `armhf` cross tools

```
docker run -it --rm -v $(pwd)/.config:/tmp/.config \
	-e ARCH=arm -e CROSS_COMPILE="ccache arm-linux-gnueabihf-" \
	moul/kernel-builder \
	/bin/bash -xec ' \
		git fetch --tags && git checkout v3.19 && \
		cp /tmp/.config .config && \
		make oldconfig && \
		cp .config /tmp/.config \
	'
```

## License

MIT
