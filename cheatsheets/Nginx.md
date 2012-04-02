
## Users and permissions

- master process runs as **root** in order to make standard ports (e.g., 80, 443) accessible
- worker processes run as **www-data**

## Configuration

- default path to configuration file: `/etc/nginx/nginx.conf`
- `nginx -V` shows version and configure options
- `nginx -c name` sets configuration file
- `nginx -g "directive"` specify additional configuration directives not included in configuration file

### Testing configuration

- `nginx -t` checks current config file for syntax, validity or integrity errors
- `nginx -t -c name.conf` checks specific file
- follow by `nginx -s reload` to start using edited config file

## Controlling daemon

- direclty via `nginx -s <signal>`, signal being:
    - **stop** send TERM signal
    - **quit** send QUIT signal
    - **reopen** reopen logs
    - **reload** reload configuration 
- sending signal causes the config file to be parsed and potentially errors thrown



