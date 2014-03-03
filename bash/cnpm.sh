#!/bin/sh

NPM_CMD=$(which npm)
STRICT=$($NPM_CMD config get strict-ssl)
AUTH=$($NPM_CMD config get always-auth)
 
$NPM_CMD config set strict-ssl false
$NPM_CMD config set always-auth true
 
$NPM_CMD --reg https://condenast.registry.nodejitsu.com $@
 
$NPM_CMD config set strict-ssl $STRICT
$NPM_CMD config set always-auth $AUTH
