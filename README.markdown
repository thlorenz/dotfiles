Disclaimer:    Most of these instructions are ripped off straight from [here][nelstromdotfiles].

Installation

    git clone git://github.com/thlorenz/dotfiles.git

Where possible, Vim plugins are installed as git submodules. Check these out by
running the commands:

    cd dotfiles
    git submodule update --init

Vim scripts without a repo will be pulled down during clone. They can be updated via:

    ruby update_vim_scripts

Create symlinks:

    ln -s ~/dotfiles/bashrc      ~/.bashrc
    ln -s ~/dotfiles/bashprofile ~/.profile
    ln -s ~/dotfiles/vimrc       ~/.vimrc
    ln -s ~/dotfiles/irbrc       ~/.irbrc
    ln -s ~/dotfiles/vim         ~/.vim
    ln -s ~/dotfiles/ctags       ~/.ctags

I put Vim's backup and swap files in `~/tmp`, so that directory must exist. To
be sure, run: 

    mkdir ~/tmp

VIM
===

My preferences for Vim are stored in `dotfiles/vimrc`. 
All plugins and scripts are stored in the `dotfiles/vim` directory.

Adding Plugin Bundles
---------------------

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
[jsbun]: http://github.com/pangloss/vim-javascript.git
[ap]: http://github.com/michaeldv/awesome_print
[i_editor]: http://github.com/jberkel/interactive_editor

