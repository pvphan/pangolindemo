TAG_NAME:=pvphan/pangolin:0.1

shell: build
	sudo xhost +local:root \
	&& docker run \
		-e DISPLAY=$DISPLAY \
		-e QT_X11_NO_MITSHM=1 \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /dev:/dev:ro \
		--gpus all
		--name orb-3-container \
		-p 8087:8087 \
		--privileged \
		--rm -it \
		${TAG_NAME} bash

build:
	DOCKER_BUILDKIT=1 docker build . -t ${TAG_NAME}
