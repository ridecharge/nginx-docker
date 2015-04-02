# Latest Ubuntu LTS
FROM ridecharge/confd

# Install nginx
RUN apt-get install --no-install-recommends -y \
	software-properties-common && \
	add-apt-repository -y ppa:nginx/development && \
	apt-get update && \
	apt-get install -y nginx ca-certificates

# Nginx and Confd config files
COPY nginx.conf /etc/nginx/nginx.conf

# Startup script for nginx
COPY nginx-wrapper.sh /tmp/nginx-wrapper.sh
RUN chmod 0500 /tmp/nginx-wrapper.sh

EXPOSE 8080/tcp
ENTRYPOINT ["/tmp/nginx-wrapper.sh"]
