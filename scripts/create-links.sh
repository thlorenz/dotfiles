#!/usr/bin/env sh

ln -F -s ~/dotfiles/bashrc      ~/.bashrc
ln -F -s ~/dotfiles/bashprofile ~/.profile
ln -F -s ~/dotfiles/inputrc     ~/.inputrc
ln -F -s ~/dotfiles/vimrc       ~/.vimrc
ln -F -s ~/dotfiles/irbrc       ~/.irbrc
ln -F -s ~/dotfiles/ctags       ~/.ctags
ln -F -s ~/dotfiles/gitconfig   ~/.gitconfig
ln -F -s ~/dotfiles/tigrc       ~/.tigrc
ln -F -s ~/dotfiles/cardinalrc  ~/.cardinalrc
ln -F -s ~/dotfiles/agignore    ~/.agignore

#ln -F -s ~/dotfiles/vim            ~/.vim
#ln -F -s ~/dotfiles/config/nstart  ~/.config/nstart
#ln -F -s ~/dotfiles/config/pkginit ~/.config/pkginit

# linux only
ln -s ~/dotfiles/X11/xinitrc    ~/.xinitrc
ln -s ~/dotfiles/X11/Xmodemap   ~/.Xmodemap
ln -s ~/dotfiles/X11/Xresources ~/.Xresources
ln -s ~/dotfiles/X11/yaourtc    ~/.yaourtc
