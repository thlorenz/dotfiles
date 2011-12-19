#!/usr/bin/env sh

cd ~/dotfiles

# Lushtags to enable Haskell support in Tagbar
cabal install lushtags

# Create lushtag/plugin folder
if [ ! -d vim/bundle/lushtags ]; then
   sudo mkdir vim/bundle/lushtags;
fi
if [ ! -d vim/bundle/lushtags/plugin ]; then
   sudo mkdir vim/bundle/lushtags/plugin;
fi

cd vim/bundle/lushtags/plugin

# Remove old version
if [ -f tagbar-haskell.vim ]; then
  sudo rm tagbar-haskell.vim;
fi

# Update with new one
sudo wget https://github.com/bitc/lushtags/raw/master/util/tagbar-haskell.vim
