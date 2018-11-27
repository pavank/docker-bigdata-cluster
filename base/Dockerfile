FROM ubuntu:18.04
LABEL Description="Base Ubuntu 18.04 image for BigData Cluster Nodes" \
      Author="Pavan Keerthi <pavan.keerthi@gmail.com>"


RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	build-essential \
        curl \
	git \
        less \
        nano \
        netcat \
	net-tools \
        software-properties-common \
        wget



RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        openjdk-8-jdk

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

RUN add-apt-repository ppa:jonathonf/python-3.7
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	python3.7 \
	python3.7-dev \
	python3-pip \
	python3.7-venv


# update pip
RUN python3.7 -m pip install pip --upgrade
RUN python3.7 -m pip install wheel
