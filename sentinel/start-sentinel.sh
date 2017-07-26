#!/bin/bash
function leader_ip {
  echo $(curl -s http://rancher-metadata/2015-12-19/containers/$1-$2-1/primary_ip)
}
/usr/local/bin/giddyup service wait scale --timeout 120
stack_name=`curl -s http://rancher-metadata/2015-12-19/self/stack/name`
sentinel_port=26379
redis_port=6379
my_ip=`echo $(curl -s http://rancher-metadata/2015-12-19/self/container/primary_ip)`
master_ip=$(leader_ip $stack_name "redis")

echo "my_ip=$my_ip"
echo "master_ip=$master_ip"
echo "stack_name=$stack_name"
echo "sentinel_port=$sentinel_port"
echo "redis_port=$redis_port"

sed -i s/%sentinel_port%/$sentinel_port/g /etc/redis/sentinel.conf
sed -i s/%redis_port%/$redis_port/g /etc/redis/sentinel.conf
sed -i s/%master_ip%/$master_ip/g /etc/redis/sentinel.conf

exec redis-sentinel /etc/redis/sentinel.conf
