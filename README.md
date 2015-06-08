docker-kernel-builder
=====================

Kernel build environment in Docker

Projects using docker-kernel-builder
------------------------------------

- https://github.com/online-labs/kernel-config
- https://github.com/moul/travis-docker/tree/master/uml-builder

Examples
--------

Checkout `v3.19` stable branch of the kernel and do a `make menuconfig` with `armhf` cross tools
```
docker run -it --rm -v $(pwd)/.config:/tmp/.config moul/kernel-builder:stable-cross-armhf \
	/bin/bash -xec ' \
		git fetch --tags && git checkout v3.19 && \
		cp /tmp/.config .config && make oldconfig && cp .config /tmp/.config \
	'
```

License
-------

MIT
