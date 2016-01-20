for file in ctags bashrc inputrc vimrc screenrc gitconfig; do
    ln -sf ~/dotfiles/$file ~/.$file
done

# Vim config
rm -rf ~/.vim;
ln -sf ~/dotfiles/vim ~/.vim
mkdir -p ~/.vim/backups ~/.vim/swaps ~/.vim/undo
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &>/dev/null

# Git completion
curl -fLo ~/dotfiles/complete/git-completion.bash \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash &>/dev/null

# if [[ `uname -v` =~ Ubuntu ]]; then
#     apt-get -qq install silversearcher-ag
# fi
# 
# if [[ `uname -v` =~ Darwin ]]; then
#     brew install ag
# fi

source ~/dotfiles/bashrc
