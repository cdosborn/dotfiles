#!/bin/bash

git clone git://git.suckless.org/st /tmp/st
cd /tmp/st;
git checkout -f 1f24bde82b19912c080fbb4a0b153a248cd6c6ea;
cp ~/dotfiles/st/* /tmp/st;
sudo make install;
rm -rf /tmp/st;
