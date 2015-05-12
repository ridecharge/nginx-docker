# nginx-docker
Docker Container for NGINX

This is the primary container for the nginx web server. 

It configures itself via the consul service with confd generating the config file and auto reloading when the keys change in consul.

It requires a single variable SERVICE_NAME to be passed in to allow for looking up the right key in consul for the application is proxying.

It is intended to be linked to the `consul` container as consul and logging container as `logging` as well as the application container it will be proxying which must be linked as `app`.

example:
`docker run -e SERVICE_NAME=someapp --link consul:consul --link logging:logging --link someapp:app nginx`
