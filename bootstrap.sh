#!/bin/bash

DEFAULT_RETENTIONS=${DEFAULT_RETENTIONS-"10s:12h,1m:2w,10m:1y,60m:5y"}

cat storage-schemas.conf.template \
    | sed "s/{{DEFAULT_RETENTIONS}}/$DEFAULT_RETENTIONS/g" \
    > /var/lib/graphite/conf/storage-schemas.conf

cat local_settings.py.template \
    | sed "s/{{MEMCACHE_HOST}}/$MEMCACHE_HOST/g" \
    > /var/lib/graphite/webapp/graphite/local_settings.py

/usr/bin/supervisord
