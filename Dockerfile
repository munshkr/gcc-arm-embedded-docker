FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    cmake \
    wget \
    && rm -rf /var/lib/apt/lists/*

ARG GCC_ARM_NONE_EABI_DIR=gcc-arm-none-eabi-10-2020-q4-major
ARG GCC_ARM_NONE_EABI_URL=https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2
ARG GCC_ARM_NONE_EABI_MD5=8312c4c91799885f222f663fc81f9a31

ENV GCC_ARM_NONE_EABI_URL=$GCC_ARM_NONE_EABI_URL
ENV GCC_ARM_NONE_EABI_MD5=$GCC_ARM_NONE_EABI_MD5

RUN wget -q -O archive.tar.bz2 ${GCC_ARM_NONE_EABI_URL} && \
    echo "${GCC_ARM_NONE_EABI_MD5}  archive.tar.bz2" | md5sum -c && \
    tar xf archive.tar.bz2 -C /opt && \
    mv /opt/${GCC_ARM_NONE_EABI_DIR} /opt/gcc-arm-toolchain && \
    rm archive.tar.bz2

ENV PATH=$PATH:/opt/gcc-arm-toolchain/bin

WORKDIR /workdir
