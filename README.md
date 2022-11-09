# template-docker-golang-exec-build

![docker version semver](https://img.shields.io/docker/v/sinlov/docker-codesenberg-bombardier?sort=semver)
[![docker image size](https://img.shields.io/docker/image-size/sinlov/docker-codesenberg-bombardier)](https://hub.docker.com/r/sinlov/docker-codesenberg-bombardier)
[![docker pulls](https://img.shields.io/docker/pulls/sinlov/docker-codesenberg-bombardier)](https://hub.docker.com/r/sinlov/docker-codesenberg-bombardier/tags?page=1&ordering=last_updated)

- docker hub see [https://hub.docker.com/r/sinlov/docker-codesenberg-bombardier](https://hub.docker.com/r/sinlov/docker-codesenberg-bombardier)

## for bombardier

- [https://github.com/codesenberg/bombardier](https://github.com/codesenberg/bombardier)

## source repo

[https://github.com/sinlov/docker-codesenberg-bombardier](https://github.com/sinlov/docker-codesenberg-bombardier)

## useage

```bash
$ sudo curl -L --fail https://raw.githubusercontent.com/sinlov/docker-codesenberg-bombardier/main/run.sh -o /usr/local/bin/bombardier
$ sudo chmod +x /usr/local/bin/bombardier
# then check
$ bombardier --help
```

## todo-list

- rename `sinlov/docker-codesenberg-bombardier` to new github url
- rename `sinlov` to new org or user
- rename `template-docker-golang-exec-build` to new docker image name
- rename target url `https://github.com/codesenberg/bombardier.git`
- rename target version `v1.2.5`
- rename target GO_SRC_PATH `github.com/codesenberg/bombardier`
- rename target CLI enter file name `bombardier.go`
- rename target `bombardier` to new exec tools name
- rename target `-o bombardier` to new out exec name
- rename target exec path `github.com/codesenberg/bombardier/bombardier` to new
- rename target ENTRYPOINT `/app/bombardier`
- add [secrets](https://github.com/sinlov/docker-codesenberg-bombardier/settings/secrets/actions) `New repository secret` name `ACCESS_TOKEN` from [hub.docker](https://hub.docker.com/settings/security)
- go cli repo [https://github.com/codesenberg/bombardier](https://github.com/codesenberg/bombardier)

## fast dev

```bash
# then test build as test/Dockerfile
$ make dockerTestRestartLatest
# clean test build
$ make dockerTestPruneLatest
```
