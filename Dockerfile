FROM ubuntu:20.04

RUN apt update \
    && apt upgrade -y \
    && apt install -y \
        curl \
        sudo \
        vim \
        wget

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | sudo bash -
RUN apt install nodejs

# Add ubuntu user and disable sudo password
RUN adduser --disabled-password --gecos "" ubuntu \
    && echo "ubuntu ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers

# ARCH = amd64 | arm64
WORKDIR /tmp
RUN echo "export ARCH=`dpkg --print-architecture`" >> envs

USER ubuntu

CMD ["/bin/bash"]
