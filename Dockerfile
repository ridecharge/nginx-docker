# Latest Ubuntu LTS
FROM ubuntu:14.04

# Install nginx
RUN apt-get install --no-install-recommends -y software-properties-common && \
	add-apt-repository -y ppa:nginx/development && \
	apt-get update && \
	apt-get install -y nginx wget ca-certificates && \
	apt-get -y upgrade 

RUN wget https://github.com/kelseyhightower/confd/releases/download/v0.7.1/confd-0.7.1-linux-amd64 -o /usr/bin/confd

COPY nginx.conf /etc/nginx/nginx.conf
COPY server.conf /etc/nginx/conf.d/server.conf

EXPOSE 8080/tcp
ENTRYPOINT ["/usr/sbin/nginx"]
