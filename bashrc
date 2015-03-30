export TERM=xterm-256color

export EDITOR=/usr/bin/vim

export PATH="$HOME/Library/Haskell/bin:$PATH" #CABAL

export PATH=/usr/local/git/bin/:$PATH #git..

[[ -s ~/dotfiles/bash_aliases ]] && . ~/dotfiles/bash_aliases 

# Readline

stty -ixon -ixoff # For Terminal to enable C-s with readline
bind -f ~/dotfiles/inputrc

# History

# On interactive startup, Bash truncates $HISTFILE to $HISTFILESIZE
# On interactive close, if the shell option histappend is set, Bash 
#   appends $HISTSIZE lines to $HISTFILE, otherwise it overwrites $HISTFILE
shopt -s histappend
HISTFILESIZE=
HISTSIZE=

# Prompt 

PS1='\W > '
#PS1='\h:\W > '
