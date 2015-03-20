export TERM=xterm-256color

export EDITOR=/usr/bin/vim

export PATH="$HOME/Library/Haskell/bin:$PATH" #CABAL

export PATH=/usr/local/git/bin/:$PATH #git..

[[ -s ~/dotfiles/bash_aliases ]] && . ~/dotfiles/bash_aliases 

bind -f ~/dotfiles/inputrc

stty -ixon -ixoff # For Terminal, enable C-s
