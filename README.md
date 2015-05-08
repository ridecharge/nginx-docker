# nginx-docker
Docker Container for NGINX

This is the primary container for the nginx web server. 

It configures itself via the consul service with confd generating the config file and auto reloading when the keys change in consul.
