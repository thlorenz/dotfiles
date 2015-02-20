## If not running interactively, don't do anything (e.g., don't screw up scp)
[ -z "$PS1" ] && return

function init () {
  # http://stackoverflow.com/a/246128/97443

  local SOURCE="${BASH_SOURCE[0]}"

  # resolve $SOURCE until the file is no longer a symlink
  while [ -h "$SOURCE" ]; do   DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"

    # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
  done
  local DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

  [ -f $DIR/bash/git-prompt.sh       ] && source $DIR/bash/git-prompt.sh
  [ -f $DIR/bash/git-prompt.sh       ] && source $DIR/bash/exports.sh
  [ -f $DIR/bash/secret-vars.sh      ] && source $DIR/bash/secret-vars.sh
  [ -f $DIR/bash/functions/index.sh  ] && source $DIR/bash/functions/index.sh
  [ -f $DIR/bash/cmd-aliases.sh      ] && source $DIR/bash/cmd-aliases.sh
  [ -f $DIR/bash/git-aliases.sh      ] && source $DIR/bash/git-aliases.sh
  [ -f $DIR/bash/node-aliases.sh     ] && source $DIR/bash/node-aliases.sh
  [ -f $DIR/bash/completion/index.sh ] && source $DIR/bash/completion/index.sh

  # Edit/source/cat this bashrc
  alias ,ev='vim ~/.bashrc'
  alias ,sv='source ~/.bashrc'
  alias ,cv='c ~/.bashrc'
}
init


# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# workflows
alias yay!='git push origin master && git push --tags && npm publish'

# other
alias serve='echo "http://localhost:3000" && http-server -p 3000 -c-1'

# Environment Variables
export EDITOR=vim
export SHELL=/usr/local/bin/bash

## we'll prefer clang if it's there
command -v clang   >/dev/null 2>&1 && export CC=clang && export GYP_DEFINES='clang=1'
command -v clang++ >/dev/null 2>&1 && export CXX=clang++ && LINK=clang++ && export GYP_DEFINES='clang=1'

# Environment tweaks
export HISTIGNORE='&:ll:ls:clear:gs:git status'

# Below are OS specific
unamestr=`uname`

# ----------- DARWIN ---------------
if [[ "$unamestr" == "Darwin" ]]; then

  echo "Configuring for $unamestr"
  # PS1="\n\[\033[00;34m\]\w\[\033[00m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\n➝  "
  PS1="\n\[\033[00;34m\]\w\[\033[00m\]\[$WHITE\]\n➝  "

  PATH=~/npm-global/bin:$GEM_HOME/bin:/usr/local/sbin/:$PATH

  alias cd-js='cd ~/dev/js'

  alias go-udesktop='ssh tlorenz@udesktop -p 2104'

  alias eject='diskutil eject'
  alias noads='rm -rf /Volumes/Kindle/system/.assets && touch /Volumes/Kindle/system/.assets'
  alias eject-kindle='noads && diskutil eject /Volumes/Kindle'

  alias pgrep='ps aux | grep '

  alias flush-dns='dscacheutil -flushcache'

  # dircolors
  export CLICOLOR=1

  # npm completion (described method doesn't work at this point: http://npmjs.org/doc/completion.html)
  source /usr/local/lib/node_modules/npm/lib/utils/completion.sh

  # git completion
  if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    source /usr/local/etc/bash_completion.d/git-completion.bash
  fi

  # autojump
  [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

  export VALUEPACK_DATA=~/.valuepack/data
  export VALUEPACK_MINE_DB=~/.valuepack/valuepack-mine.db
  export VALUEPACK_FIX_DB=~/.valuepack/valuepack-fix.db
  export VALUEPACK_ANALYZE_DB=~/.valuepack/valuepack-analyze.db

# ----------- LINUX ---------------

# ---- ARCH ----

elif [ "$unamestr" == "Linux" ] && [ -f /etc/pacman.conf ]; then
  echo "Configuring for ARCH-$unamestr"
  PS1="\n\[\033[00;34m\]arch:\w\[\033[00m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\n➝  "

  PATH=~/npm-global/bin:$GEM_HOME/bin:$PATH

  shopt -s checkwinsize

  # docker
  export DOCKER_HOST='unix:///var/run/docker.sock'
  alias docker="sudo docker -H=$DOCKER_HOST"

  # pacman
  alias pacman='sudo pacman'
  alias pacmany='pacman --noconfirm'

  # tmux
  alias tmux='TERM=xterm-256color tmux'

  alias jadd='autojump -a `pwd`'
  alias j='cd `autojump $1`'

  alias do-transmission="sudo systemctl start transmission"
  alias ki-transmission="sudo systemctl stop transmission"

  [ -f /usr/lib/node_modules/npm/lib/utils/completion.sh ] && source /usr/lib/node_modules/npm/lib/utils/completion.sh

  [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# ---- All other linuxes ----
elif [[ "$unamestr" == "Linux" ]]; then

  echo "Configuring for $unamestr"
  PS1="\n\[\033[00;34m\]$(whoami):\w\[\033[00m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\n➝  "

  PATH=~/npm-global/bin:$GEM_HOME/bin:$PATH

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
  PS1="\n\[\033[00;34m\]\w\[\033[00m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\n➝  "
  echo "No special configuration known for $unamestr"
fi
