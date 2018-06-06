#!/bin/bash
test -d /data/web/public && \
    (cd /data/web/public && git checkout master && git pull origin master) || \
    git clone https://github.com/ByteInternet/community.hypernode.io /data/web/public

test -d /data/web/public/hypernode-docker && \
    (cd /data/web/public/hypernode-docker && git checkout master && git pull origin master) || \
    git clone https://github.com/ByteInternet/hypernode-docker /data/web/public/hypernode-docker

test -d /data/web/public/hypernode-vagrant && \
    (cd /data/web/public/hypernode-vagrant && git checkout master && git pull origin master) || \
    git clone https://github.com/ByteInternet/hypernode-vagrant /data/web/public/hypernode-vagrant

test -d /data/web/public/hypernode-magerun && \
    (cd /data/web/public/hypernode-docker && git checkout master && git pull origin master) || \
    git clone https://github.com/Hypernode/hypernode-magerun /data/web/public/hypernode-magerun

