#!/bin/bash

echo zk://$ZK_HOSTS/mesos > /etc/mesos/zk
echo 4400 /etc/chronos/conf/http_port

/usr/bin/chronos
