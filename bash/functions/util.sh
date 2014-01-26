# lots come from http://apple.stackexchange.com/questions/5435/got-any-tips-or-tricks-for-terminal-in-mac-os-x

# Open a man page in Preview:
pman () {
  man -t $@ | open -f -a /Applications/Preview.app
}

# Open a man page in vim
vman () {
  MANWIDTH=150 MANPAGER='col -bx' man $@ | vim -R -c "set ft=man" -
}
