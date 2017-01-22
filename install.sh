#!/bin/bash

# Symlink conf files
for file in ~/dotfiles/conf/*; do
    name=`basename $file`
    ln -sf $file ~/.$name
done

# Symlink scripts into /usr/local/bin
for file in ~/dotfiles/scripts/*; do
    name=`basename $file`
    ln -sf $file /usr/local/bin/$name
done

# Install vim
rm -rf ~/.vim;
ln -sf ~/dotfiles/vim ~/.vim
mkdir -p ~/.vim/backups ~/.vim/swaps ~/.vim/undo
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &>/dev/null

# Install ubuntu packages
if [[ `uname -v` =~ Ubuntu ]]; then
    ~/dotfiles/ubuntu/install.sh
fi

# Install osx packages
if [[ `uname -v` =~ Darwin ]]; then
    ~/dotfiles/osx/install.sh
fi

source ~/dotfiles/conf/bashrc
