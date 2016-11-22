FROM debian:latest
MAINTAINER ken5scal

RUN apt-get update && apt-get upgrade -y && \
    apt-get --no-install-recommends -y \
        unzip && \
    apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
