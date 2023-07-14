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
    && rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install -r requirements.txt
