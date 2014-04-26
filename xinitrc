#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#
# Written by Phil Muller 


## Ensure that the D-Bus Communication System is running properly to fix
## File management, authentication, and other essential system processes

if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi


## Ensure that GTK themes are applied uniformly in the Desktop Environment

export GTK2_RC_FILES="$HOME/.gtkrc-2.0" 


## Where the default Home folders have not already been created, generate them

if [ -x /usr/bin/xdg-user-dirs-update ]; then
   /usr/bin/xdg-user-dirs-update
fi

## Ensure that obmenu-generator (a pipe menu) is set to the user.
## Does this for each session (i.e. ease of use for addtional
## accounts where created.

sed 's/_user_/'$(whoami)'/' ~/.config/obmenu-generator/schema.pl -i
sed 's/_user_/'$(whoami)'/' ~/.config/obmenu-generator/config.pl -i

if [ -s ~/.Xmodemap ]; then
  xmodmap ~/.Xmodemap
fi

setxkbmap -option caps:ctrl_modifier

# make non-mac keyboards behave like mac keyboards (option-command swap)
# setxkbmap -option altwin:swap_alt_win

# faster keyboard repeat rate
xset r rate 180 40

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

exec i3
