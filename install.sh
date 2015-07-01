for file in bashrc inputrc vimrc screenrc; do
    ln -sf ~/dotfiles/$file ~/.$file
done

if [ -d ~/.vim ]; then
    rm -f ~/.vim;
    ln -sf ~/dotfiles/vim ~/.vim
fi;
