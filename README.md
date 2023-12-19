# docker-codesenberg-bombardier

![docker version semver](https://img.shields.io/docker/v/sinlov/docker-codesenberg-bombardier?sort=semver)
[![docker image size](https://img.shields.io/docker/image-size/sinlov/docker-codesenberg-bombardier)](https://hub.docker.com/r/sinlov/docker-codesenberg-bombardier)
[![docker pulls](https://img.shields.io/docker/pulls/sinlov/docker-codesenberg-bombardier)](https://hub.docker.com/r/sinlov/docker-codesenberg-bombardier/tags?page=1&ordering=last_updated)

- docker hub see [https://hub.docker.com/r/sinlov/docker-codesenberg-bombardier](https://hub.docker.com/r/sinlov/docker-codesenberg-bombardier)

## for bombardier

- [https://github.com/codesenberg/bombardier](https://github.com/codesenberg/bombardier)

## usage

- with bash

```bash
$ docker run -it --rm sinlov/docker-codesenberg-bombardier:latest -c 200 -d 10s -l http://httpbin.org/get
# or use tag
$ docker run -it --rm sinlov/docker-codesenberg-bombardier:1.2.6 -c 200 -d 10s -l http://httpbin.org/get
```

- with exec

```bash
$ sudo curl -L --fail https://raw.githubusercontent.com/sinlov/docker-codesenberg-bombardier/main/run.sh -o /usr/local/bin/bombardier
$ sudo chmod +x /usr/local/bin/bombardier
# then check
$ bombardier --help
```

## source repo

[https://github.com/sinlov/docker-codesenberg-bombardier](https://github.com/sinlov/docker-codesenberg-bombardier)

### env

- minimum go version: go 1.19
- change `go 1.19`, `^1.19`, `1.19.13-bullseye`, `1.19.13` to new go version
## fast dev

```bash
# then test build as test/Dockerfile
$ make dockerTestRestartLatest
# clean test build
$ make dockerTestPruneLatest
```
