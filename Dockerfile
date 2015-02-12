# Latest Ubuntu LTS
FROM ubuntu:14.04

# Install nginx
RUN apt-get install --no-install-recommends -y software-properties-common && \
	add-apt-repository -y ppa:nginx/development && \
	apt-get update && \
	apt-get install -y nginx && \
	apt-get -y upgrade 

COPY nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["/usr/sbin/nginx"]
