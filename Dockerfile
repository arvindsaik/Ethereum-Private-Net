FROM ubuntu:16.04

FROM golang:1.10 as builder

RUN apk add --no-cache make gcc musl-dev linux-headers

# RUN apt-get update && apt-get install -y software-properties-common

# RUN add-apt-repository ppa:gophers/archive && apt-get update && apt-get install golang-1.10-go

# RUN apt-get update
# RUN apt-get install git

ADD go-ethereum /go-ethereum

RUN cd /go-ethereum && make geth

# Pull Geth into a second stage deploy alpine container
# FROM alpine:latest

# RUN apk add --no-cache ca-certificates
COPY ./build/bin/geth /usr/local/bin/

LABEL version="1.0"
LABEL maintainer="krishnanarvind100@gmail.com"

# ENV DEBIAN_FRONTEND=noninteractive

# RUN apt-get update && apt-get install --yes software-properties-common
# RUN add-apt-repository ppa:ethereum/ethereum
# RUN apt-get update && apt-get install --yes geth

# RUN apt-get update && apt-get install make

RUN adduser --disabled-login --gecos "" eth_user

# COPY go-ethereum /home/eth_user/go-ethereum

# WORKDIR /home/eth_user/go-ethereum

# RUN make geth

RUN cd ..

COPY eth_common /home/eth_user/eth_common
RUN chown -R eth_user:eth_user /home/eth_user/eth_common

USER eth_user

WORKDIR /home/eth_user

RUN geth init eth_common/genesis.json

ENTRYPOINT bash

