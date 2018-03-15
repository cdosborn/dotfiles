#!/bin/bash

if [ ! -d /tmp/st ]; then
    git clone git://git.suckless.org/st /tmp/st
fi;
cd /tmp/st;
git checkout -f 1f24bde82b19912c080fbb4a0b153a248cd6c6ea;
cp ~/dotfiles/st/* /tmp/st;
sudo make install;
