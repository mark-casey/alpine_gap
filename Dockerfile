FROM alpine:latest

RUN apk --update add bash curl git libzmq nodejs php \
    php-cli php-curl php-intl php-json php-phar \
    wget zeromq-dev && \
    apk add php-zmq --update-cache --repository \
    http://dl-4.alpinelinux.org/alpine/edge/testing/ \
    --allow-untrusted && \
    rm -rf /var/cache/apk/* && \
    npm install -g grunt-cli

# 'ARG' seems to be a very new option in Docker and Quay.io's version of Docker is complaining
#ARG path="/var/work"
ENV path="/var/work"

RUN mkdir -p $path

WORKDIR $path

ENTRYPOINT ["/bin/sh", "-c"]

CMD ["bash"]
