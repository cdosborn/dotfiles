#!/bin/bash
for file in ~/dotfiles/conf/*; do
    tail=${file##*/}
    ln -sf $file ~/.$tail
done

# Vim config
rm -rf ~/.vim;
ln -sf ~/dotfiles/vim ~/.vim
find ~/.vim/ -exec sudo chown -R cdosborn:staff {} +
mkdir -p ~/.vim/backups ~/.vim/swaps ~/.vim/undo
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &>/dev/null

if [[ `uname -v` =~ Darwin ]] && [[ `whoami` =~ root ]]; then
    apt-get -qq install silversearcher-ag
fi


if [[ `uname -v` =~ Darwin ]]; then
    # Install ag if it doesnt exist
    which ag &>/dev/null || brew install ag
     ~/dotfiles/osx/install.sh
fi

source ~/dotfiles/conf/bashrc
