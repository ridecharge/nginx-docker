#!/bin/sh
if [ -z "$1" ]; then
	echo The first parameter must be an subfolder name.
	exit 1
fi

docker push sgarlick987/nginx-$1
