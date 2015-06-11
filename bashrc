export TERM=xterm-256color

# Aliases

[ -f ~/dotfiles/aliases ] && source ~/dotfiles/aliases 

# Functions

[ -f ~/dotfiles/functions ] && source ~/dotfiles/functions 

# Vim

export EDITOR="vim -u ~/dotfiles/vim/vimrc"

# Completion

#source "$(brew --prefix)/share/bash-completion/bash_completion";
#[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;
 
# FZF

[ -f ~/dotfiles/fzf/fzf.bash ] && source ~/dotfiles/fzf/fzf.bash

#NVM

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Readline

stty -ixon -ixoff # For Terminal to enable C-s with readline
bind -f ~/dotfiles/inputrc

# Coreutils

PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
#export MANPATH="$(brew --prefix coreutils)/libexec/gnuman/man1"

# History

# On interactive startup, Bash truncates $HISTFILE to $HISTFILESIZE
# On interactive close, if the shell option histappend is set, Bash 
#   appends $HISTSIZE lines to $HISTFILE, otherwise it overwrites $HISTFILE
shopt -s histappend
HISTFILESIZE=
HISTSIZE=

# Prompt 

PS1='\W > '

#export XDG_CONFIG_HOME=~/dotfiles/fish/
#exec fish
