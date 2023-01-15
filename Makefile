TAG_NAME:=pvphan/pangolin:0.1
WORKDIR_PATH=/pangolindemo
REPO_PATH:=$(dir $(abspath $(firstword $(MAKEFILE_LIST))))
GUI_PREAMBLE:=sudo xhost +local:root
GUI_FLAGS:= \
	-e DISPLAY=${DISPLAY} \
	-e QT_X11_NO_MITSHM=1 \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v ${REPO_PATH}:${WORKDIR_PATH}:ro \
	-v /dev:/dev:ro \

shell: build
	${GUI_PREAMBLE} \
	&& docker run \
		${GUI_FLAGS} \
		--privileged \
		--rm -it \
		${TAG_NAME} bash

build:
	DOCKER_BUILDKIT=1 docker build . -t ${TAG_NAME}
