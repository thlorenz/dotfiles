#!/usr/bin/env bash

mkdir -p ~/.config
unamestr=`uname`

rm -f ~/.bashrc ~/.bashprofile

ln -sf ~/dotfiles/bashrc             ~/.bashrc
ln -sf ~/dotfiles/bashprofile        ~/.profile
ln -sf ~/dotfiles/inputrc            ~/.inputrc
ln -sf ~/dotfiles/vimrc              ~/.vimrc
ln -sf ~/dotfiles/irbrc              ~/.irbrc
ln -sf ~/dotfiles/ctags              ~/.ctags
ln -sf ~/dotfiles/gitconfig          ~/.gitconfig
ln -sf ~/dotfiles/gitignore          ~/.gitignore
ln -sf ~/dotfiles/tigrc              ~/.tigrc
ln -sf ~/dotfiles/cardinalrc         ~/.cardinalrc
ln -sf ~/dotfiles/agignore           ~/.agignore
ln -sf ~/dotfiles/tmux/tmux.conf     ~/.tmux.conf 
ln -sf ~/dotfiles/lldb/lldbinit-lldb ~/.lldbinit-lldb 
ln -sf ~/dotfiles/tern-config        ~/.tern-config
ln -sf ~/dotfiles/tmuxifier          ~/.tmuxifier
ln -sf ~/dotfiles/vimputrc          ~/.vimputrc

ln -sf ~/dotfiles/vim         ~/.vim

mkdir -p .config
ln -sf ~/dotfiles/config/nstart  ~/.config/nstart
ln -sf ~/dotfiles/config/pkginit ~/.config/pkginit

# linux only
if [ "$unamestr" == "Linux" ] && [ -f /etc/pacman.conf ]; then
  ln -sf ~/dotfiles/X11/xinitrc      ~/.xinitrc
  ln -sf ~/dotfiles/X11/Xmodemap     ~/.Xmodemap
  ln -sf ~/dotfiles/X11/Xresources   ~/.Xresources
  ln -sf ~/dotfiles/X11/yaourtc      ~/.yaourtc
  ln -sf ~/dotfiles/config/surfraw   ~/.config/surfraw
fi

# mac only
if [ "$unamestr" == "Darwin" ]; then
  ln -sf ~/dotfiles/slate ~/.slate
  echo "Run scripts/xcode.sh in order to setup Xcode plugins and settings"
fi
