FROM alpine:latest

ENV AWS_CLI_VERSION 1.16.61

RUN apk --no-cache update \
    && apk --no-cache add \
        python \
        py-pip \
        py-setuptools \
        ca-certificates \
        groff \
        less \
        nodejs \
        yarn \
        zip \
        git \
        openssh-client \
    && pip --no-cache-dir install awscli==${AWS_CLI_VERSION} \
    && rm -rf /var/cache/apk/*

RUN apk add --no-cache --virtual .gyp \
        make \
        g++ \
    && yarn global add \
        node-gyp \
    && apk del .gyp