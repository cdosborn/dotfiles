#!/bin/bash

if [ ! -d /tmp/dmenu ]; then
    git clone git://git.suckless.org/dmenu /tmp/dmenu
fi;
cd /tmp/dmenu
git checkout -f bbc464dc80225b8cf9390f14fac6c682f63940d2
cp ~/dotfiles/dmenu/* /tmp/dmenu;
sudo make install;
