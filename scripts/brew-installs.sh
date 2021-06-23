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

# change brightness of monitors programatically
brew install brightness

# cast keys
brew cask install keycastr

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

# emacs
brew tap d12frosted/emacs-plus
brew install emacs-plus
rm -rf /Applications/Emacs.app
ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications/Emacs.app

# mac emacs (needed to work well with tools like yabai)
# brew tap railwaycat/emacsmacport
# rm -rf /Applications/Emacs.app
# brew cask install emacs-mac
# brew untap railwaycat/emacsmacport

# pdflatex to convert emacs org files to pdf
brew cask install mactex

# yabai and related keyboard hooks
# this tool proved too unstable for now
# brew install koekeishiya/formulae/yabai
# sudo yabai --install-sa
# brew services start yabai
# brew install koekeishiya/formulae/skhd
# brew services start skhd
# killall Dock

# To have launchd start d12frosted/emacs-plus/emacs-plus now and restart at login:
#   brew services start d12frosted/emacs-plus/emacs-plus

## emacs/doom deps
# https://github.com/hlissner/doom-emacs/blob/develop/docs/getting_started.org#with-homebrew
brew install ripgrep
brew install coreutils fd

brew link
brew doctor
