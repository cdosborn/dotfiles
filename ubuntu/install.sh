#!/bin/bash
# Get the latest version of git
sudo apt-add-repository -y ppa:git-core/ppa
sudo apt-add-repository -y ppa:pi-rho/dev
sudo apt-get update

for pkg in curl vim git xsel silversearcher-ag tree moreutils ctags jq entr tmux; do
    sudo apt-get install -qy "$pkg";
    if [ "$?" -ne 0 ]; then
        echo "Note: $pkg wasn't found, and could not be installed." >&2;
    fi
done;

# Install xmonad
if [ ! -d ~/.xmonad ]; then
    mkdir ~/.xmonad
fi;
ln -sf ~/dotfiles/xmonad/xmonad.hs ~/.xmonad/xmonad.hs
