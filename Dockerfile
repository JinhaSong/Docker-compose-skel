FROM ubuntu:16.04

RUN apt-get update \
    && apt-get -y install python \
    python-pip \
    python-dev \
    git ssh vim

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes #prohibit-password/' /etc/ssh/sshd_config

RUN pip install --upgrade pip
RUN pip install setuptools

WORKDIR /workspace
ADD . .

RUN chmod -R a+w /workspace

EXPOSE 8000
