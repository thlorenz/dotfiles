# Set nice prompt
PS1="\n\[\033[1;37m\]\u@\h \[\033[00;34m\]\w\[\033[00m\]\n\# $ "

# Vim Terminal mode
set -o vi
bind -m vi-insert "\C-l":clear-screen 

# Aliases
alias ll="ls -la"

# Edit/source/cat this bash
alias ,ev='vim ~/.bashrc'
alias ,sv='source ~/.bashrc'
alias ,cv='cat ~/.bashrc'

# Launch mvim
alias :e='mvim'

# Git
alias ga='git add'
alias gr='git add -u'
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

PATH=~/Library/Haskell/bin:~/.cabal/bin:$PATH:/usr/local/lib/node_modules/jasmine-node/bin/

# Temporary aliases
alias cd-haskell='cd ~/dev/haskell'
alias cd-realworld='cd ~/dev/haskell/real-world'

# Functions
function SetTitle
{
  local title=$1
  echo -n -e "\033]0;$title\007"
}
