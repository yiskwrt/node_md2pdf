#!/bin/bash
#local_http_proxy="http://addr:port/"
#local_https_proxy="http://addr:port/"

if [ ! -z ${local_http_proxy} ]; then
	docker info | grep "HTTP Proxy" | grep ${local_http_proxy}
	if [ $? -ne 0 ]; then
		echo "WARNING: docker daemon might not have http_proxy settings"
	fi
	buildarg_http_proxy="--build-arg=http_proxy=${local_http_proxy}"
fi
if [ ! -z ${local_https_proxy} ]; then
	docker info | grep "HTTPS Proxy" | grep ${local_https_proxy}
	if [ $? -ne 0 ]; then
		echo "WARNING: docker daemon might not have https_proxy settings"
	fi
	buildarg_https_proxy="--build-arg=https_proxy=${local_https_proxy}"
fi

docker build --network=host ${buildarg_http_proxy} ${buildarg_https_proxy} . -t node_md2pdf
