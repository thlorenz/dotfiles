# lots come from http://apple.stackexchange.com/questions/5435/got-any-tips-or-tricks-for-terminal-in-mac-os-x

# Open a man page in Preview:
pman () {
  man -t $@ | open -f -a /Applications/Preview.app
}

# Open a man page in vim
vman () {
  MANWIDTH=150 MANPAGER='col -bx' man $@ | vim -R -c "set ft=man" -
}

# Get pid of node process
pid () {
  pid=`ps -A | grep node | egrep -v grep | egrep -v '\(' | awk '{print $1}'`
  export pid
  echo $pid
}

# Prepend given dir or current dir to PATH
padd() {
  current=`pwd`
  p=${1:-$current}
  p=$(cd $p; pwd)
  if [ -d "$p" ] && [[ ":$PATH:" != *":$p:"* ]]; then
      PATH="$p:$PATH"
  fi
}

compresspdf() {
  \gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile=$2 $1
}
