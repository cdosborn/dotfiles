#!/bin/bash
for file in ~/dotfiles/conf/*; do
    tail=${file##*/}
    ln -sf $file ~/.$tail
done

# Vim config
rm -rf ~/.vim;
ln -sf ~/dotfiles/vim ~/.vim
# find ~/.vim/ -exec sudo chown -R cdosborn:staff {} +
mkdir -p ~/.vim/backups ~/.vim/swaps ~/.vim/undo
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &>/dev/null

if [[ `uname -v` =~ Ubuntu ]]; then
    apt-get -qq install silversearcher-ag
fi


if [[ `uname -v` =~ Darwin ]]; then
    # Install ag if it doesnt exist
     ~/dotfiles/osx/install.sh
fi

source ~/dotfiles/conf/bashrc
