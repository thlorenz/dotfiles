#!/usr/bin/env sh

# Replace ctags with exuberant ctags
if [ -f /usr/bin/.originals/ctags ]; then
  echo "Looks like ctags was already replaced \t=>\t skipping ctags-exuberant";
else
  brew install ctags-exuberant

  if [ ! -d /usr/bin/.originals ]; then
     sudo mkdir /usr/bin/.originals;
  fi
  sudo mv /usr/bin/ctags /usr/bin/.originals/
  sudo ln -s /usr/local/bin/ctags /usr/bin/ctags
fi  

