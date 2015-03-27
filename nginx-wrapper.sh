#!/bin/bash
sed -i "s:SERVICE_NAME:$SERVICE_NAME:g" /etc/confd/conf.d/nginx.toml

/usr/bin/confd -backend consul -node consul:8500 \
	-debug -verbose -config-file /etc/confd/conf.d/nginx.toml -watch &
echo "[nginx] starting..."
exec /usr/sbin/nginx
