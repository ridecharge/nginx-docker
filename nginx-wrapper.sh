#!/bin/bash
sed -i "s:SERVICE_NAME:$SERVICE_NAME:g" /etc/confd/conf.d/nginx.toml
/usr/bin/confd -onetime -backend consul -node consul:8500
exec /usr/sbin/nginx