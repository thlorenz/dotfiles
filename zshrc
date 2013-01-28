ZSH=$HOME/dotfiles/zsh
ZSH_THEME="robbyrussell"

plugins=(vi-mode my-git svn autojump dircycle)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Change this value to set how frequently ZSH updates
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"
