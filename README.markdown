**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [Disclaimer](#disclaimer)
- [Installation](#installation)
	- [Create symlinks:](#create-symlinks:)
	- [Tagbar Plugin](#tagbar-plugin)
- [VIM](#vim)
	- [Updating all Plugin modules to latest version](#updating-all-plugin-modules-to-latest-version)
	- [Adding Plugin Bundles](#adding-plugin-bundles)

# Disclaimer

Most of these instructions are ripped off straight from [here][nelstromdotfiles].

# Installation

    git clone git://github.com/thlorenz/dotfiles.git

Where possible, Vim plugins are installed as git submodules. Check these out by
running the commands:

    cd dotfiles
    git submodule update --init

Vim scripts without a repo will be pulled down during clone. They can be updated via:

    ruby update_vim_scripts

## Create symlinks:

    ln -s ~/dotfiles/bashrc      ~/.bashrc
    ln -s ~/dotfiles/bashprofile ~/.profile
    ln -s ~/dotfiles/inputrc     ~/.inputrc
    ln -s ~/dotfiles/vimrc       ~/.vimrc
    ln -s ~/dotfiles/irbrc       ~/.irbrc
    ln -s ~/dotfiles/vim         ~/.vim
    ln -s ~/dotfiles/ctags       ~/.ctags
    ln -s ~/dotfiles/gitconfig   ~/.gitconfig
    ln -s ~/dotfiles/tigrc       ~/.tigrc
    ln -s ~/dotfiles/cardinalrc  ~/.cardinalrc
    ln -s ~/dotfiles/agignore    ~/.agignore

    ln -s ~/dotfiles/config/nstart  ~/.config/nstart
    ln -s ~/dotfiles/config/pkginit ~/.config/pkginit

    cp ~/dotfiles/fonts/* ~/Library/Fonts/

## Tagbar Plugin

In order for the tagbar plugin to work, we replace the original ctags with a [better version][exuberant].

Assuming you are on a Mac and have [Homebrew][homebrew] installed run:

    sudo sh ~/dotfiles/installs/ctags-exuberant.sh

# Misc

## Install pygments

`sudo easy_install Pygments`

# VIM

On a Mac install macvim and use it's built in cli vim via:

    brew install macvim --override-system-vim

Then make sure that `/usr/local/bin` is first in your `PATH`.

My preferences for Vim are stored in `dotfiles/vimrc`. 

All plugins and scripts are stored in the `dotfiles/vim` directory.

## Updating all Plugin modules to latest version

In order to update all submodules to the latest 'master' you can do:
    
    git submodule foreach git pull origin master


## Autojump

In order to use the [autojump plugin](https://github.com/joelthelion/autojump) 

`brew install autojump`

## Adding Plugin Bundles

Plugins that are published on github can be installed as submodules. For
example, to install the [JavaScript bundle][jsbun], follow these steps:

    cd ~/dotfiles
    git submodule add http://github.com/pangloss/vim-javascript.git vim/bundle/vim-javascript

This will update the `.gitmodules` file by appending something like:

    [submodule "vim/bundle/vim-javascript"]
        path = vim/bundle/vim-javascript
        url = http://github.com/pangloss/vim-javascript.git
    
As well as checkout out the git repo into the
`vim/bundle/vim-javascript` directory. You can then commit these changes
as follows:

    git add .
    git ci -m "Added the javascript bundle"

[nelstromdotfiles]: https://github.com/nelstrom/dotfiles
[exuberant]: http://ctags.sourceforge.net/
[homebrew]: http://mxcl.github.com/homebrew/ 
[jsbun]: http://github.com/pangloss/vim-javascript.git
[ap]: http://github.com/michaeldv/awesome_print
[i_editor]: http://github.com/jberkel/interactive_editor
