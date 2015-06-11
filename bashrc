export TERM=xterm-256color

# Source

for file in \
    ~/dotfiles/aliases \
    ~/dotfiles/functions \
    ~/dotfiles/fzf/fzf.bash \
    $(brew --prefix nvm)/nvm.sh; do
    [ -f $file ] && source $file
done

# Exports

export EDITOR="vim"
export NVM_DIR=~/.nvm

# Readline

# For Terminal to enable C-s with readline
stty -ixon -ixoff

# Coreutils

PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# History

# On interactive startup, Bash truncates $HISTFILE to $HISTFILESIZE
# On interactive close, if the shell option histappend is set, Bash 
#   appends $HISTSIZE lines to $HISTFILE, otherwise it overwrites $HISTFILE
shopt -s histappend
HISTFILESIZE=
HISTSIZE=

# Prompt 

PS1='\W > '
