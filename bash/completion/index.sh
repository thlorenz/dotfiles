function sourceCompletions () {
  local DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  [ -f $DIR/git.sh     ] && source $DIR/git.sh
  [ -f $DIR/ssh.sh     ] && source $DIR/ssh.sh
  [ -f $DIR/brew.sh    ] && source $DIR/brew.sh
  [ -f $DIR/vagrant.sh ] && source $DIR/vagrant.sh
  [ -f $DIR/tmux.sh    ] && source $DIR/tmux.sh
}

sourceCompletions
