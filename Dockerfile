FROM debian:latest
MAINTAINER ken5scal

ENV GOPHISH_VER v0.1.2

RUN apt-get update && apt-get upgrade -y && \
    apt-get install --no-install-recommends -y \
        unzip \
        wget \
        ca-certificates && \
    apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN wget https://github.com/gophish/gophish/releases/download/${GOPHISH_VER}/gophish_linux_64bit.zip -P /tmp/
RUN unzip /tmp/gophish_linux_64bit -d /tmp/ && mv /tmp/gophish_linux_64bit /usr/local/gophish && rm -rf /tmp/gophish_linux_64bit

COPY config.json /usr/local/gophish/config.json
RUN chmod +x /usr/local/gophish/gophish

WORKDIR /usr/local/gophish
EXPOSE 3333 80
ENTRYPOINT ["./gophish"]
