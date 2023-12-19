# This dockerfile uses extends image https://hub.docker.com/bridgewwater/bombardier
# VERSION 1
# Author: bridgewwater
# dockerfile offical document https://docs.docker.com/engine/reference/builder/
# https://hub.docker.com/_/golang
FROM golang:1.19.13-bullseye as builder

ARG GO_PKG_RELEASE_VERSION=1.2.6
ARG GO_ENV_PACKAGE_NAME=github.com/codesenberg/bombardier
ARG GO_ENV_ROOT_BUILD_BIN_NAME=bombardier
ARG GO_ENV_ROOT_BUILD_BIN_PATH=build/${GO_ENV_ROOT_BUILD_BIN_NAME}
ARG GO_ENV_ROOT_BUILD_ENTRANCE=bombardier.go

ARG GO_PATH_SOURCE_DIR=/go/src
RUN mkdir -p ${GO_PATH_SOURCE_DIR}
WORKDIR ${GO_PATH_SOURCE_DIR}
# COPY $PWD ${GO_PATH_SOURCE_DIR}/${GO_ENV_PACKAGE_NAME}

RUN git clone https://${GO_ENV_PACKAGE_NAME}.git -b v${GO_PKG_RELEASE_VERSION} --depth=1 ${GO_ENV_PACKAGE_NAME}
WORKDIR ${GO_PATH_SOURCE_DIR}/${GO_ENV_PACKAGE_NAME}

RUN go mod download -x

RUN CGO_ENABLED=0 \
  go build \
  -a \
  -installsuffix cgo \
  -ldflags '-w -s --extldflags "-static -fpic"' \
  -tags netgo \
  -o ${GO_ENV_ROOT_BUILD_BIN_PATH}

# https://hub.docker.com/_/alpine
FROM alpine:3.19

ARG DOCKER_CLI_VERSION=${DOCKER_CLI_VERSION}
ARG GO_ENV_PACKAGE_NAME=github.com/codesenberg/bombardier
ARG GO_ENV_ROOT_BUILD_BIN_NAME=bombardier
ARG GO_ENV_ROOT_BUILD_BIN_PATH=build/${GO_ENV_ROOT_BUILD_BIN_NAME}

ARG GO_PATH_SOURCE_DIR=/go/src

#RUN apk --no-cache add \
#  ca-certificates mailcap curl \
#  && rm -rf /var/cache/apk/* /tmp/*

RUN mkdir /app
WORKDIR /app

COPY --from=builder ${GO_PATH_SOURCE_DIR}/${GO_ENV_PACKAGE_NAME}/${GO_ENV_ROOT_BUILD_BIN_PATH} .
ENTRYPOINT [ "/app/bombardier" ]
# CMD ["/app/bombardier", "--help"]