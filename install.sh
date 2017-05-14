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
mkdir -p ~/.vim ~/.vim/backups ~/.vim/swaps ~/.vim/undo ~/.vim/colors ~/.vim/autoload
for file in ~/dotfiles/vim/autoload/*; do
    name=`basename $file`
    ln -sf $file ~/.vim/autoload/$name
done
for file in ~/dotfiles/vim/colors/*; do
    name=`basename $file`
    ln -sf $file ~/.vim/colors/$name
done
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/b44ea685aa2899316e58cba646095fa7551f8808/plug.vim

# Install ubuntu packages
if [[ `uname -v` =~ Ubuntu ]]; then
    ~/dotfiles/ubuntu/install.sh
fi

# Install osx packages
if [[ `uname -v` =~ Darwin ]]; then
    ~/dotfiles/osx/install.sh
fi

source ~/dotfiles/conf/bashrc
