# Authors of WBITT Network-Multitool:
# 'However, if you have a special need, for a special tool, for your special use-case,
# then I would recommend to simply build your own docker image using this one as base image, and expanding it with the tools you need.'

ARG IMAGE_NAME=wbitt/network-multitool
ARG IMAGE_TAG=latest

FROM $IMAGE_NAME:$IMAGE_TAG
LABEL authors="aktelion"

RUN apk update && \
    apk add fish && \
    apk add neovim && \
    apk add bat && \
    apk add postgresql

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN sed -i 's@/bin/ash@/usr/bin/fish@g' /etc/passwd && \
    sed -i 's@/bin/sh@/usr/bin/fish@g' /etc/passwd

