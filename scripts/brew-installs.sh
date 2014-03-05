#!/usr/bin/env sh

(command -v brew >/dev/null 2>&1) || ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

brew update
brew install macvim --override-system-vim
brew install the_silver_searcher
brew install tree
brew install htop
brew install autojump

brew tap phinze/cask
brew install brew-cask
brew cask install google-chrome
brew cask install bettertouchtool
brew cask install iterm2
brew cask install limechat
brew cask install transmission
brew cask install vlc

brew clean
brew link
brew doctor
