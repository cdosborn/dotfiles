export TERM=xterm-256color

export EDITOR=/usr/bin/vim
export MYVIMRC=~/dotfiles/vimrc

export PATH="$HOME/Library/Haskell/bin:$PATH" #CABAL

export PATH=/usr/local/git/bin/:$PATH #git..

# Source bash aliases
if [ -f ~/dotfiles/bash_aliases ]; then
    . ~/dotfiles/bash_aliases
fi

bind -f ~/dotfiles/inputrc
