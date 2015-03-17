export TERM=xterm-256color

export EDITOR=/usr/bin/vim

export PATH="$HOME/Library/Haskell/bin:$PATH" #CABAL

export PATH=/usr/local/git/bin/:$PATH #git..

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

bind -f ~/.inputrc
