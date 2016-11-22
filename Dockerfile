FROM debian:latest
MAINTAINER ken5scal

ENV GOPHISH_VER v0.1.2

RUN apt-get update && apt-get upgrade -y && \
    apt-get install --no-install-recommends -y \
        unzip \
        wget && \
    apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

WORKDIR /usr/local/
RUN wget https://github.com/gophish/gophish/releases/download/${GOPHISH_VER}/gophish_linux_64bit.zip -P /tmp/
RUN unzip /tmp/gophish_linux_64bit && mv gophish_linux_64bit gophish && rm -rf /tmp/gophish_linux_64bit

WORKDIR /usr/local/gophish
COPY config.json config.json
RUN chmod +x gophish

ENTRYPOINT ["./gophish"]
