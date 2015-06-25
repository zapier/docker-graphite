# docker-graphite

A simple Dockerfile that runs Graphite/Carbon (and nothing else!) based on
https://github.com/nickstenning/docker-graphite.

Most projects aim to combine nginx, statsd, and others. If you're using
[brubeck](https://github.com/github/brubeck) or some other aggregator, and
nginx is running elsewhere, then this is for you.

## Usage

```bash
$ docker build -t graphite .
$ docker run graphite
```

## Available Environment Variables

* `DEFAULT_RETENTIONS`: The Carbon storage retention rule to use for all patterns apart from carbon.* (default: `10s:12h,1m:2w,10m:1y,60m:5y`)
* `MEMCACHE_HOST`: The memcache host to use for Graphite (default: none)
