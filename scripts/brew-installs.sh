#!/usr/bin/env sh

(command -v brew >/dev/null 2>&1) || ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

brew update

brew tap phinze/cask
brew install brew-cask

# dev/terminal tools
brew install tree
brew install htop-osx
brew install iftop
brew install tmux
brew install wget
brew install autojump
brew install bash

# Debugger/Compiler support
brew install autoconf
brew install cmake

brew install nmap
# brew install openssl
brew install pkg-config

# change brightness of monitors programatically
brew install brightness

# change audio output programatically used in ../bash/scripts/audio
brew install switchaudio-osx

# cast keys
brew cask install keycastr

brew install bettertouchtool
brew install iterm2
brew install transmission
brew install vlc

###########################
# Improved Command line utilities
###########################
# https://github.com/ibraheemdev/modern-unix

## lsd  (ls Deluxe)
### Setup fonts on iTerm2: (https://github.com/Peltoche/lsd/issues/199#issuecomment-494218334)
brew tap homebrew/cask-fonts
brew install --cask font-sauce-code-pro-nerd-font
# alternative font: brew install --cask font-hack-nerd-font
brew install lsd

## dust (better du)
brew tap tgotwig/linux-dust && brew install dust

## duf (better df)
brew install duf

## bottom (better top)
### Configure via $HOME/.config/bottom/bottom.toml
### https://github.com/ClementTsang/bottom/tree/master/sample_configs
### https://clementtsang.github.io/bottom/configuration/config-file/flags/
brew tap clementtsang/bottom && brew install bottom

# yabai and related keyboard hooks
brew install koekeishiya/formulae/yabai
sudo yabai --install-sa
brew install koekeishiya/formulae/skhd

# productivity
brew install terminal-notifier

brew link
brew doctor
