FROM alpine:3.8

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
        make \
        g++ \
    && pip --no-cache-dir install awscli==${AWS_CLI_VERSION} \
    && rm -rf /var/cache/apk/*
    