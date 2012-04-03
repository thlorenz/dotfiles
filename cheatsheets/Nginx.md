# Nginx 

## Users and permissions

- master process runs as **root** in order to make standard ports (e.g., 80, 443) accessible
- worker processes run as **www-data** (or any other customized user and group)

## Testing configuration

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

## Configuration

- default path to configuration file: `/etc/nginx/nginx.conf`
- `nginx -V` shows version and configure options
- `nginx -c name` sets configuration file
- `nginx -g "directive"` specify additional configuration directives not included in configuration file

## Modules overview

### Core module

- `error log /file/path level;` (level: debug, info, notice, warm, error, crit)
- `master_process [on|off];` if off, nginx works with unique process (use for testing)
- `user username <groupname>` define user account and optionally user group for worker processes
- `worker_threads num;` amount of threads per worker

### Events module

- configure network mechanisms (may affect appliciation's perfomnace)
- `worker_connections num;` amount of connections a worker process may treat simultaneously

### Configuration module

- enables file inclusions
- `include file` inserts content of file at exact location of inclusion
- multi file inclusion, e.g, `include sites/*.conf`

## Adapting setups

- worker processes should match number of cores in CPU

## Performance

- `httperf --server <address> --port <num> --uri /index.html --rate <num> --num-conn <num> --num-call <num> --timeout <num>`
    - **rate** reqs/sec
    - **num-conn** total amount of connections
    - **num-call** reqs/connection
    - **timeout** elapsed secs until req is considered lost

## HTTP Configuration

### HTTP Core module

- allows websites to be served, also known as **virtual hosts**



