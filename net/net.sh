#!/bin/sh

export LANG=zh_CN.UTF-8
export LC_ALL="zh_CN.UTF-8"

ifconfig eth0 192.168.200.237
route add default gw 192.168.200.1
