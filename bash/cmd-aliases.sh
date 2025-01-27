# enable color support of ls and also add color related aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Aliases
alias ll='ls -alhF'
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
alias nt='node -r $HOME/npm-global/lib/node_modules/esbuild-runner/register.js'
alias nts='node -r $HOME/npm-global/lib/node_modules/esbuild-runner/register.js --test-reporter=spec'
alias ntw='node -r $HOME/npm-global/lib/node_modules/esbuild-runner/register.js --test-reporter=spec --watch'
alias ntd='node -r $HOME/npm-global/lib/node_modules/esbuild-runner/register.js --test-reporter=dot'

## corona
function execute {
  cmd=("$@")
  echo "${cmd[*]}"
  "${cmd[@]}"
}

CORONA_SIMULATOR="/Applications/CoronaSDK/Corona Simulator.app/Contents/MacOS/Corona Simulator"
function corona_run () {
  ROOT=`pwd`
  MAIN="$ROOT/main.lua"
  execute "$CORONA_SIMULATOR" -no-console YES -project $MAIN
}

function corona_debug () {
  ROOT=`pwd`
  MAIN="$ROOT/main.lua"
  DEBUGGER=1 execute "$CORONA_SIMULATOR" -no-console YES -debug 1 -project $MAIN
}

## tmux

alias sb='tmux save-buffer -'
alias sbc='tmux save-buffer - | pbcopy'

## VsCode

alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
alias stud='/Applications/Visual\ Studio.app/Contents/MacOS/VisualStudio'

## Luzid
alias cluzid='cargo run --manifest-path $HOME/dev/mb/wizard/luzid/rs/Cargo.toml'
alias cluzidr='cargo run --release --manifest-path $HOME/dev/mb/wizard/luzid/rs/Cargo.toml'

# MB Validator
alias cvalidator='cargo run --manifest-path $HOME/dev/mb/wizard/magicblock-validator/Cargo.toml'
alias cvalidatorr='cargo run --release --manifest-path $HOME/dev/mb/wizard/magicblock-validator/Cargo.toml'

# Cody AI assistant
# https://github.com/sourcegraph/cody/blob/b0556863e5d679189b655f8448338681fdc86d45/lib/shared/src/models/dotcom.ts#L48C24-L48C60
alias ai='cody chat --model anthropic::2023-06-01::claude-3-opus -m'
