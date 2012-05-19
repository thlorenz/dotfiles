# Haskell Platform

## Installation

    sudo apt-get install haskell-platform

This installs all tools including cabal.

## Building from Source

In case available packages cause trouble.

Download Haskell Platform and GHC from [here](http://hackage.haskell.org/platform/linux.html).

Follow [these instructions](http://www.vex.net/~trebla/haskell/haskell-platform.xhtml) and/or
tweak this [script](https://gist.github.com/2352845).

## Building GHC

### Dependencies

`sudo apt-get install libbsd-dev libgmp3-dev zlib1g-dev freeglut3-dev`

- if we get *error while loading shared libraries: libgmp.so.3: cannot open
  shared object file: No such file or directory*, fix **libgmp.so.3** by
  linking it to a newer version already present on the system , e.g., 
  `sudo ln -s /usr/lib/libgmp.so.10.0.1 /usr/lib/libgmp.so.3`

### Configure and Make

Set prefix, so that it goes into relevant haskell platform folder in order to archieve isolated installations:
    ./configure --prefix=/usr/local/haskell-platform-2011.4.0.0

Then: `make install`

# Git

## Installation
    sudo apt-get git

## SSH keys

Follow [these](http://help.github.com/mac-set-up-git/) instructions.

    ssh-keygen -t rsa -C "your_email@youremail.com"

    git config --global user.name "Firstname Lastname"
    git config --global user.email "your_email@youremail.com"
