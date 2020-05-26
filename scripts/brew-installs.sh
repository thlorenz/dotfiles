#!/usr/bin/env sh

(command -v brew >/dev/null 2>&1) || ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

brew update

brew tap phinze/cask
brew install brew-cask

# dev/terminal tools
brew install macvim
brew install the_silver_searcher
brew install tree
brew install htop-osx
brew install iftop
# brew install tig
brew install tmux
brew install wget
brew install autojump
brew install bash
# brew install chrome-cli


# Debugger/Compiler support
brew install autoconf
brew install cmake
# brew install ctags
# brew install homebrew/dupes/gdb
# brew install swig

# devops
brew install ansible
# brew install s3cmd
# brew install ssh-copy-id

brew install nmap
brew install openssl
brew install pkg-config

# testing
# brew install wrk
# brew install siege

## Some like chrome seemed to have permissions problems when installed this way
# brew cask install google-chrome
# brew cask install bettertouchtool
# brew cask install iterm2
# brew cask install limechat
# brew cask install transmission
# brew cask install vlc

# emacs
brew tap d12frosted/emacs-plus
brew install emacs-plus
ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications/Emacs.app

# pdflatex to convert emacs org files to pdf
brew cask install mactex
# Emacs pdf tools dependencies (https://github.com/politza/pdf-tools)
brew install poppler automake 
brew install pkg-config poppler automake 

# To have launchd start d12frosted/emacs-plus/emacs-plus now and restart at login:
#   brew services start d12frosted/emacs-plus/emacs-plus

## emacs/doom deps
# https://github.com/hlissner/doom-emacs/blob/develop/docs/getting_started.org#with-homebrew
brew install ripgrep
brew install coreutils fd

brew link
brew doctor
