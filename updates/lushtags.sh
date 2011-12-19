#!/usr/bin/env sh

# Lushtags to enable Haskell support in Tagbar
cabal install lushtags

# Create lushtag/plugin folder
if [ ! -d ../vim/bundles/lushtags ]; then
   sudo mkdir ../vim/bundles/lushtags;
fi
if [ ! -d ../vim/bundles/lushtags/plugin ]; then
   sudo mkdir ../vim/bundles/lushtags/plugin;
fi

pushd
cd ../vim/bundles/lushtags/plugin

# Remove old version
if [ -f tagbar-haskell.vim ]; then
  rm tagbar-haskell.vim;
fi

# Update with new one
wget https://github.com/bitc/lushtags/raw/master/util/tagbar-haskell.vim
popd
