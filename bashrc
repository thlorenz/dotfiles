# Set nice prompt
PS1="\n\[\033[1;37m\]\u@\h \[\033[00;34m\]\w\[\033[00m\]\n\# $ "

# Vim Terminal mode
set -o vi
bind -m vi-insert "\C-l":clear-screen 

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
  alias cd-realworld='cd ~/dev/haskell/real-world'

  alias go-userver='ssh tlorenz@userver -p 222'
  alias go-nginx='ssh tlorenz@nginx -p 222'

  alias eject='diskutil eject'
  alias eject-kindle='diskutil eject /Volumes/Kindle'

  alias :e='mvim'

# ----------- LINUX ---------------
elif [[ "$unamestr" == "Linux" ]]; then

  echo "Configuring for $unamestr"

  PATH=~/.cabal/bin:$PATH

  alias cd-haskell='cd ~/dev/haskell'
  alias :e='vim'
  
  alias update="sudo apt-get update"
  alias install="sudo apt-get install"
  alias upgrade="sudo apt-get upgrade"
  alias remove="sudo apt-get remove"
  
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

