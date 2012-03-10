#!/usr/bin/env sh

# Lushtags enable Haskell support in Tagbar

# Install binaries
cabal install lushtags

# Install vim file

# The remaining changes will apply to pathogen's bundle folder
cd ~/dotfiles/vim/bundle

# Create lushtag/plugin folder
if [ ! -d lushtags ]; then
   sudo mkdir lushtags;
fi
if [ ! -d lushtags/plugin ]; then
   sudo mkdir lushtags/plugin;
fi

cd lushtags/plugin

# Remove old version
if [ -f tagbar-haskell.vim ]; then
  sudo rm tagbar-haskell.vim;
fi

# Update with new one
sudo wget https://github.com/bitc/lushtags/raw/master/util/tagbar-haskell.vim
