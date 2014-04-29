#!/usr/bin/env sh

# add a little ambience
command -v mpg123 >/dev/null 2>&1 && mpg123 ~/dotfiles/X11/sounds/dial-up-modem.mp3 &

tries=0
ping google.com -c 1 &>/dev/null
until [[ $? -eq 0 || $tries -gt 5 ]]; do
  tries=$tries+1
  sleep 1
  ping google.com -c 1 &>/dev/null
done;
exit $?
