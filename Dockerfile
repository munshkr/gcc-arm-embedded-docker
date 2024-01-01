FROM debian:bookworm-slim

ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O archive.tar.bz2 \
    https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2
    tar xf archive.tar.bz2 -C /opt --transform='s|^[^/]\+|gcc-arm-toolchain|' && \
    rm archive.tar.bz2

ENV PATH="/opt/gcc-arm-toolchain/bin:${PATH}"

ENTRYPOINT ["/bin/bash"]
