#!/bin/bash
sed -i "s:SERVICE_NAME:$SERVICE_NAME:g" /etc/confd/conf.d/nginx.toml

# This will error when reloading nginx since it's not started
# but this is not a problem.
/usr/bin/confd -onetime -backend consul -node consul:8500 \
	-debug -verbose -config-file /etc/confd/conf.d/nginx.toml

/usr/bin/confd -backend consul -node consul:8500 \
	-debug -verbose -config-file /etc/confd/conf.d/nginx.toml -watch &

exec /usr/sbin/nginx
