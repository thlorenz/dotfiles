#!/usr/bin/env bash

mkdir -p ~/.config
unamestr=`uname`

if [ "$unamestr" == "Linux" ]; then
  cp ~/dotfiles/fonts/* /usr/share/fonts
elif [ "$unamestr" == "Darwin" ]; then
  cp ~/dotfiles/fonts/* ~/Library/Fonts/ 
fi
