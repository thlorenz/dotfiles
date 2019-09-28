function sourceFns () {
  local DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  [ -f $DIR/ngen.sh   ] && source $DIR/ngen.sh
  [ -f $DIR/window.sh ] && source $DIR/window.sh
  [ -f $DIR/git.sh    ] && source $DIR/git.sh
  [ -f $DIR/github.sh ] && source $DIR/github.sh
  [ -f $DIR/c.sh      ] && source $DIR/c.sh
  [ -f $DIR/util.sh   ] && source $DIR/util.sh
}

sourceFns
