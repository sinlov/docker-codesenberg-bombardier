# This dockerfile
# VERSION 1
# Author: sinlov
# dockerfile offical document https://docs.docker.com/engine/reference/builder/

# maintainer="https://github.com/sinlov/docker-codesenberg-bombardier"

# https://hub.docker.com/_/golang/tags
FROM golang:1.19.2-buster as builder

ARG GO_PATH_SOURCE_DIR=/go/src
WORKDIR ${GO_PATH_SOURCE_DIR}

RUN git clone https://github.com/codesenberg/bombardier.git --depth=1 github.com/codesenberg/bombardier

# download deps before gobuild
# share gomod cache
RUN --mount=type=cache,id=gomod,target=/go/pkg/mod \
    cd ${GO_PATH_SOURCE_DIR}/github.com/codesenberg/bombardier && \
    go mod download -x && \
    go mod tidy && \
    go get -u golang.org/x/sys
# directories are not shared
# builder-linux-amd64:/go/bin/app-amd64
# builder-linux-arm64:/go/bin/app-arm64

RUN --mount=type=cache,id=gomod,target=/go/pkg/mod \
  cd ${GO_PATH_SOURCE_DIR}/github.com/codesenberg/bombardier && \
  go mod vendor && \
  CGO_ENABLED=0 \
  go build \
  -v \
  -installsuffix cgo \
  -ldflags '-w -s --extldflags "-static -fpic"' \
  -tags netgo \
  -o bombardier

# https://hub.docker.com/_/alpine
FROM alpine:latest

ARG DOCKER_CLI_VERSION=${DOCKER_CLI_VERSION}

RUN apk --no-cache add \
  ca-certificates mailcap curl \
  && rm -rf /var/cache/apk/* /tmp/*

RUN mkdir /app
WORKDIR /app

COPY --from=builder /go/src/github.com/codesenberg/bombardier/bombardier .
ENTRYPOINT ["/app/bombardier"]
# CMD ["/app/bombardier", "--help"]