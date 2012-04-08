## If not running interactively, don't do anything (e.g., don't screw up scp)
[ -z "$PS1" ] && return 

# Set nice prompt
PS1="\n\[\033[1;32m\]\u@\h \[\033[00;34m\]\w\[\033[00m\]\n\# $ "

# Vim Terminal mode
set -o vi
bind -m vi-insert "\C-l":clear-screen 

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


# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Edit/source/cat this bash
alias ,ev='vim ~/.bashrc'
alias ,sv='source ~/.bashrc'
alias ,cv='cat ~/.bashrc'

# Git
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status --ignore-submodules'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'

# Use Vim (from MacVim) to get Ruby support
alias vim='/usr/local/Cellar/macvim/7.3-63/MacVim.app/Contents/MacOS/Vim'

# Environment Variables
export EDITOR=vim

# Functions
function SetTitle
{
  local title=$1
  echo -n -e "\033]0;$title\007"
}

# Below are OS specific

unamestr=`uname`

# ----------- DARWIN ---------------
if [[ "$unamestr" == "Darwin" ]]; then

  echo "Configuring for $unamestr"

  PATH=~/Library/Haskell/bin:~/.cabal/bin:$PATH:/usr/local/lib/node_modules/jasmine-node/bin/

  alias cd-haskell='cd ~/dev/haskell'
  alias cd-webtoink='cd ~/dev/haskell/projects/WebToInk/webtoink'
  alias cd-realworld='cd ~/dev/haskell/real-world'

  alias go-userver='ssh tlorenz@userver -p 222'
  alias go-udesktop='ssh tlorenz@udesktop -p 222'
  alias go-nginx='ssh tlorenz@nginx -p 222'
  alias go-sb-nginx='ssh tlorenz@sb-nginx -p 222'
  alias go-webtoink='ssh tlorenz@webtoink.thlorenz.com -p 222'

  alias eject='diskutil eject'
  alias eject-kindle='diskutil eject /Volumes/Kindle'

  alias :e='mvim'

  # dircolors 
  export CLICOLOR=1

  # Maven colors
  source ~/dotfiles/colorize-maven.darwin.sh

# ----------- LINUX ---------------
elif [[ "$unamestr" == "Linux" ]]; then

  echo "Configuring for $unamestr"

  PATH=~/.cabal/bin:$PATH

  alias cd-haskell='cd ~/dev/haskell'
  alias cd-webtoink='cd ~/dev/haskell/webtoink/WebToInk'

  alias :e='sudo vim'
  alias vim='sudo vim'
  
  # apt-get aliases
  alias update="sudo apt-get update"
  alias install="sudo apt-get install"
  alias upgrade="sudo apt-get upgrade"
  alias remove="sudo apt-get remove"

  # services aliases
  alias service="sudo service"
  alias nx-restart="service nginx restart"
  alias nx-test="sudo nginx -t" 

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

