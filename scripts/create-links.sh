#!/usr/bin/env bash

mkdir -p ~/.config
unamestr=`uname`

rm -f ~/.bashrc ~/.bashprofile

ln -s ~/dotfiles/bashrc             ~/.bashrc
ln -s ~/dotfiles/bashprofile        ~/.profile
ln -s ~/dotfiles/inputrc            ~/.inputrc
ln -s ~/dotfiles/vimrc              ~/.vimrc
ln -s ~/dotfiles/irbrc              ~/.irbrc
ln -s ~/dotfiles/ctags              ~/.ctags
ln -s ~/dotfiles/gitconfig          ~/.gitconfig
ln -s ~/dotfiles/tigrc              ~/.tigrc
ln -s ~/dotfiles/cardinalrc         ~/.cardinalrc
ln -s ~/dotfiles/agignore           ~/.agignore
ln -s ~/dotfiles/tmux/tmux.conf     ~/.tmux.conf 
ln -s ~/dotfiles/lldb/lldbinit-lldb ~/.lldbinit-lldb 

ln -s ~/dotfiles/vim         ~/.vim

ln -s ~/dotfiles/config/nstart  ~/.config/nstart
ln -s ~/dotfiles/config/pkginit ~/.config/pkginit

# linux only
if [ "$unamestr" == "Linux" ] && [ -f /etc/pacman.conf ]; then
  ln -s ~/dotfiles/X11/xinitrc      ~/.xinitrc
  ln -s ~/dotfiles/X11/Xmodemap     ~/.Xmodemap
  ln -s ~/dotfiles/X11/Xresources   ~/.Xresources
  ln -s ~/dotfiles/X11/yaourtc      ~/.yaourtc
  ln -s ~/dotfiles/config/surfraw   ~/.config/surfraw
fi

# mac only
if [ "$unamestr" == "Darwin" ]; then
  ln -s ~/dotfiles/slate ~/.slate
  echo "Run scripts/xcode.sh in order to setup Xcode plugins and settings"
fi
