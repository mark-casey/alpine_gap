FROM alpine:latest

RUN apk --update add curl git libzmq nodejs php \
    php-cli php-curl php-intl php-json php-phar php-zmq \
    wget zeromq-dev && rm -rf /var/cache/apk/* && \
    npm install -g grunt-cli

ARG path=/var/work

RUN mkdir -p $path

WORKDIR $path

ENTRYPOINT ["/bin/bash", "-c"]

CMD ["bash"]
