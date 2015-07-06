for file in bashrc inputrc vimrc screenrc; do
    ln -sf ~/dotfiles/$file ~/.$file
done

if [ -d ~/.vim ]; then
    rm -f ~/.vim;
    ln -sf ~/dotfiles/vim ~/.vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &>/dev/null
fi;

# Install firefox custom theme
#
# ln -sf ~/dotfiles/firefox/chrome/ ~/Library/Application\ Support/Firefox/Profiles/*.default/chrome
#
