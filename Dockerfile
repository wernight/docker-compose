FROM alpine:3.5

RUN set -x && \
    apk add --no-cache -t .deps ca-certificates curl && \
    # Install glibc on Alpine (required by docker-compose) from
    # https://github.com/sgerrand/alpine-pkg-glibc
    # See also https://github.com/gliderlabs/docker-alpine/issues/11
    GLIBC_VERSION='2.23-r3' && \
    curl -Lo /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub && \
    curl -Lo glibc.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC_VERSION/glibc-$GLIBC_VERSION.apk && \
    curl -Lo glibc-bin.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC_VERSION/glibc-bin-$GLIBC_VERSION.apk && \
    apk update && \
    apk add glibc.apk glibc-bin.apk && \
    rm -rf /var/cache/apk/* glibc.apk glibc-bin.apk && \
    \
    # Clean-up
    apk del .deps

ARG DOCKER_COMPOSE_VERSION

RUN set -x && \
    apk add --no-cache -t .deps ca-certificates curl && \
    # Install docker-compose
    # https://docs.docker.com/compose/install/
    DOCKER_COMPOSE_LATEST=$(curl -L https://github.com/docker/compose/releases/latest | grep -Eo 'href=\"[^"]+docker-compose-Linux-x86_64' | sed 's/^href="//' | grep -Eo '\d+.\d+.\d+') && \
    DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION:-$DOCKER_COMPOSE_LATEST} && \
    curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-Linux-x86_64 > /usr/local/bin/docker-compose && \
    chmod a+rx /usr/local/bin/docker-compose && \
    \
    # Basic check it works
    docker-compose version && \
    \
    # Clean-up
    apk del .deps

VOLUME /code
WORKDIR /code

ENTRYPOINT ["/usr/local/bin/docker-compose"]
