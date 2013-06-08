## If not running interactively, don't do anything (e.g., don't screw up scp)
[ -z "$PS1" ] && return 

# git prompt
[ -f ~/dotfiles/bashscripts/git-prompt.sh ] && source ~/dotfiles/bash/git-prompt.sh

# secret vars
[ -f ~/dotfiles/secret-vars.sh ] && source ~/dotfiles/secret-vars.sh

# Set nice prompt
PS1="\n\[\033[00;34m\]\w\[\033[00m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\n➝  "
# PS1="\n\[\033[1;38m\]\u@\h \[\033[00;34m\]\w\[\033[00m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\n➝  "

# enable color support of ls and also add color related aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias c='pygmentize -O style=monokai -f console256 -g'

# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Edit/source/cat this bash
alias ,ev='vim ~/.bashrc'
alias ,sv='source ~/.bashrc'
alias ,cv='c ~/.bashrc'

# Git
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status --ignore-submodules -s'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull --rebase'
alias gcl='git clone'

# workflows
alias yay!='git push origin master && git push --tags && npm publish'

# other
alias serve='echo "http://localhost:3000" && http-server -p 3000 -c-1'

# Environment Variables
export EDITOR=vim
export SHELL=/usr/local/bin/bash

# Environment tweaks
export HISTIGNORE='&:ll:ls:ls *:gs:git status:cd *'

. ~/dotfiles/functions.sh
. ~/dotfiles/bash/exports.sh

# Below are OS specific
unamestr=`uname`

# ----------- DARWIN ---------------
if [[ "$unamestr" == "Darwin" ]]; then

  echo "Configuring for $unamestr"

  PATH=~/Library/Haskell/bin:~/.cabal/bin:$PATH:/usr/local/bin

  alias cd-js='cd ~/dev/js'

  alias go-udesktop='ssh tlorenz@udesktop -p 2104'

  alias eject='diskutil eject'
  alias eject-kindle='diskutil eject /Volumes/Kindle'

  # Use Vim (from MacVim) to get Ruby support
  alias vim='/usr/local/Cellar/macvim/7.3-63/MacVim.app/Contents/MacOS/Vim'
  # alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

  alias :e='mvim'

  alias pgrep='ps aux | grep '
  
  alias flush-dns='dscacheutil -flushcache'

  # dircolors 
  export CLICOLOR=1

  # Maven colors
  source ~/dotfiles/colorize-maven.darwin.sh

  # npm completion (described method doesn't work at this point: http://npmjs.org/doc/completion.html)
  source /usr/local/lib/node_modules/npm/lib/utils/completion.sh

  # git completion
  if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    source /usr/local/etc/bash_completion.d/git-completion.bash
  fi


  # autojump
  [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

  # cd tweaks
  export CDPATH='~:~/dev/js/projects'

  export VALUEPACK_DATA=~/.valuepack/data
  export VALUEPACK_MINE_DB=~/.valuepack/valuepack-mine.db

# ----------- LINUX ---------------
elif [[ "$unamestr" == "Linux" ]]; then

  echo "Configuring for $unamestr"

  PATH=~/.cabal/bin:$PATH

  # TODO: test if folder exists -- Custom installed ghc binary folder
  PATH=/usr/local/haskell-platform-2011.4.0.0/bin/:$PATH

  alias cd-haskell='cd ~/dev/haskell'
  alias cd-webtoink='cd ~/dev/haskell/webtoink/webtoink'

  alias go-ec2='ssh -i ~/.ssh/userver-micro_rsa.pem ubuntu@ec2-micro'

  alias :e='sudo vim'
  alias svim='sudo vim'
  
  # apt-get aliases
  alias update="sudo apt-get update"
  alias install="sudo apt-get install"
  alias upgrade="sudo apt-get upgrade"
  alias remove="sudo apt-get remove"

  # services aliases
  alias service="sudo service"
  alias nx-restart="service nginx restart"
  alias nx-test="sudo nginx -t" 

  alias do-transmission="transmission-daemon -g ~/.config/transmission"
  alias ki-transmission="service transmission-daemon stop"

  # check the window size after each command and, if necessary,
  # update the values of LINES and COLUMNS.
  shopt -s checkwinsize

 
  # set variable identifying the chroot you work in (used in the prompt below)    
  if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
      debian_chroot=$(cat /etc/debian_chroot)
  fi
else
  echo "No special configuration known for $unamestr"
fi

