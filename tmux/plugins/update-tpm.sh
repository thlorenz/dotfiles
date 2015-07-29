#!/bin/sh

# update to latest
VERSION=2.0.0

curl -L "https://github.com/tmux-plugins/tpm/archive/v$VERSION.tar.gz" | tar xvz

mv tpm-$VERSION tpm
rm -rf tpm/tests tpm/run-tests tpm/*.md tpm/Vagrantfile tpm/vagrant_provisioning.sh tpm/.travis.yml tpm/.gitignore
