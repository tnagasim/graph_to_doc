FROM mcr.microsoft.com/devcontainers/python:0-3.11
RUN apt-get update \
    && apt-get install -y wget \
    bash \
    git \
    gcc \
    g++ \
    gfortran \
    liblapack-dev \
    libamd2 \
    libcholmod3 \
    libmetis-dev \
    libsuitesparse-dev \
    libnauty2-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install --upgrade setuptools wheel pip
ARG USERNAME=devcon
ARG USER_UID=1005
ARG USER_GID=100

RUN useradd -m -s /bin/bash -u ${USER_UID} -g ${USER_GID} ${USERNAME}
USER ${USERNAME}
