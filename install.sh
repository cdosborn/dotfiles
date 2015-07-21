for file in bashrc inputrc vimrc screenrc gitconfig; do
    ln -sf ~/dotfiles/$file ~/.$file
done

# Vim config
rm -rf ~/.vim;
ln -sf ~/dotfiles/vim ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &>/dev/null
mkdir ~/.vim/backups ~/.vim/swaps ~/.vim/undo

# Install firefox custom theme
#
# ln -sf ~/dotfiles/firefox/chrome/ ~/Library/Application\ Support/Firefox/Profiles/*.default/chrome
#
