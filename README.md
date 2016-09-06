# Supported tags and respective `Dockerfile` links

  * [`latest` (Dockerfile)](https://github.com/wernight/docker-compose/blob/master/Dockerfile) [![](https://images.microbadger.com/badges/image/wernight/docker-compose.svg)](https://microbadger.com/images/wernight/docker-compose "Get your own image badge on microbadger.com")
  * [`1`, `1.8`, `1.8.0`, (Dockerfile)](https://github.com/wernight/docker-compose/blob/v1.8.0/Dockerfile) [![](https://images.microbadger.com/badges/image/wernight/docker-compose:1.8.svg)](https://microbadger.com/images/wernight/docker-compose "Get your own image badge on microbadger.com")
  * [`1.7`, `1.7.1` (Dockerfile)](https://github.com/wernight/docker-compose/blob/v1.7.1/Dockerfile) [![](https://images.microbadger.com/badges/image/wernight/docker-compose:1.7.svg)](https://microbadger.com/images/wernight/docker-compose "Get your own image badge on microbadger.com")
  * [`1.6`, `1.6.2` (Dockerfile)](https://github.com/wernight/docker-compose/blob/v1.6.2/Dockerfile) [![](https://images.microbadger.com/badges/image/wernight/docker-compose:1.6.svg)](https://microbadger.com/images/wernight/docker-compose "Get your own image badge on microbadger.com")
  * [`1.5`, `1.5.2` (Dockerfile)](https://github.com/wernight/docker-compose/blob/v1.5.2/Dockerfile) [![](https://images.microbadger.com/badges/image/wernight/docker-compose:1.5.svg)](https://microbadger.com/images/wernight/docker-compose "Get your own image badge on microbadger.com")


## What is `docker-compose`

[`docker-compose`](https://docs.docker.com/compose/) is useful during development and to simplify building and running linked Docker images.

## Usage example

    $ docker run -v /var/run/docker.sock:/var/run/docker.sock:ro -v $PWD:/code:ro --rm wernight/docker-compose build

  - `/code` is the default current working directory.
  - You can run as any user, for example as yourself by adding `--user $UID`.

Note: You should use a `docker-compose` version that is compatible with your `docker` version.

## Feedbacks

Suggestions are welcome on our [GitHub issue tracker](https://github.com/wernight/docker-compose/issues).
