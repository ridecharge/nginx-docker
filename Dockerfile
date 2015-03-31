# Latest Ubuntu LTS
FROM ubuntu:14.04

# Install nginx
RUN apt-get update && \
	apt-get -y upgrade && \
	apt-apt-get install --no-install-recommends -y \
	software-properties-common && \
	add-apt-repository -y ppa:nginx/development && \
	apt-get update && \
	apt-get install -y nginx ca-certificates

# Install confd
ADD https://github.com/kelseyhightower/confd/releases/download/v0.7.1/confd-0.7.1-linux-amd64 /usr/bin/confd
RUN chmod 0500 /usr/bin/confd
RUN mkdir -p /etc/confd/conf.d
RUN mkdir -p /etc/confd/templates

# Nginx and Confd config files
COPY nginx.conf /etc/nginx/nginx.conf
COPY server_confd.toml /etc/confd/conf.d/nginx.toml
COPY server.conf.tmpl /etc/confd/templates/server.conf.tmpl

# Startup script for nginx
COPY nginx-wrapper.sh /tmp/nginx-wrapper.sh
RUN chmod 0500 /tmp/nginx-wrapper.sh

EXPOSE 8080/tcp
ENTRYPOINT ["/tmp/nginx-wrapper.sh"]
