FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

RUN apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	freeglut3-dev \
	g++ \
	libeigen3-dev \
	libglew-dev \
	libglu1-mesa-dev \
	make \
	mesa-common-dev \
        cmake \
        git \
        python3-dev \
        python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip install pybind11 numpy PyOpenGL

WORKDIR /tmp
RUN export GIT_SSL_NO_VERIFY=1 \
	&&git clone https://github.com/pvphan/pangolin.git \
	&& cd pangolin \
	&& git checkout main \
	&& mkdir build \
	&& cd build
	#&& cmake .. \
	#&& make -j8 \
	#&& cd .. \
	#&& python setup.py install
