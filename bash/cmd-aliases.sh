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
alias tree='tree -I node_modules'
alias info='info --vi-keys' 

alias growup='rm -rf .git/hooks/pre-commit'
alias http-codes="node -p 'require(\"http\").STATUS_CODES' | c"

alias make-targets="make -qsp 2>/dev/null | egrep '^[^#%\.=]*:[^=]' | awk -F ': ' '{ print $2}'"
alias make-targets-verbose="make -qp | sed -n -e 's/^\([^.#[:space:]][^:[:space:]]*\): .*/\1/p'"

alias utelinit="ssh -t udesktop 'sudo telinit 0'"

# Docker
export DOCKER_HOST=unix:///var/run/docker.sock
alias docker="sudo docker -H $DOCKER_HOST"

## rm all docker containers
alias drmc='docker rm `docker ps -a -q`'

## stop all docker containers
alias dstc='docker stop `docker ps -a -q`'

## rm all untagged docker images 
function drmi () {
  docker rmi `docker images | grep '^<none>' | awk '{print $3}'`
}

## lldb on Mac

alias db='/Applications/Xcode.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/Resources/debugserver localhost:3000 --attach '

## node

alias node_configure='./configure --gdb --debug --without-snapshot --xcode --v8-options="--gdbjit --gdbjit-full --expose-gc"'
alias node_v8_options="node -e 'console.dir(process.config.variables.node_v8_options)'"
