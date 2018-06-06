#!/bin/bash
[ ! -f /etc/hypernode/is_vagrant -a ! -f /etc/hypernode_is_docker ] && flock -n /data/web/.dehydrated.lock chronic dehydrated --cron --create-dirs
