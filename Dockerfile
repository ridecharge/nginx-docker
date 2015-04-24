FROM registry.gocurb.internal:80/confd

# Install nginx
RUN apt-get install --no-install-recommends -y \
	software-properties-common && \
	add-apt-repository -y ppa:nginx/development && \
	apt-get update && \
	apt-get install -y nginx nginx-extras ca-certificates

COPY nginx.conf /etc/nginx/nginx.conf

COPY nginx-wrapper.sh /tmp/nginx-wrapper.sh
RUN chmod 0500 /tmp/nginx-wrapper.sh

EXPOSE 8080/tcp
ENTRYPOINT ["/tmp/nginx-wrapper.sh"]
