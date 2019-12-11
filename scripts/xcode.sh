#!/usr/bin/env bash

echo "Linking FontAndColor Themes"
rm -rf ~/Library/Developer/Xcode/UserData/FontAndColorThemes && \
ln -s ~/dotfiles/xcode/UserData/FontAndColorThemes ~/Library/Developer/Xcode/UserData/FontAndColorThemes

## Settings
mv    ~/Library/Developer/Xcode/UserData/KeyBindings ~/Library/Developer/Xcode/UserData/KeyBindings.orig && \
ln -s ~/dotfiles/xcode/UserData/KeyBindings        ~/Library/Developer/Xcode/UserData/KeyBindings

echo "No longer Installing Alcatraz Plugin Manager"
echo "Follow instructions at https://github.com/XVimProject/XVim2 instead"
# curl -fsSL https://raw.github.com/supermarin/Alcatraz/master/Scripts/install.sh | sh

echo "Now open Xcode and allow XVim plugins"

## Plugins (Not working) -- need to be installed manually via Alcatraz manager
# find  ~/dotfiles/xcode/Plug-ins -maxdepth 1 -mindepth 1 -type d -exec \
#  ln -s '{}' ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/ \;
