# Source

for file in \
    ~/dotfiles/aliases \
    ~/dotfiles/functions \
    ~/dotfiles/fzf/fzf.bash \
    /usr/local/opt/nvm/nvm.sh; do
    [ -f $file ] && source $file
done

# Readline

# For Terminal to enable C-s with readline
stty -ixon -ixoff

# History

# On interactive startup, Bash truncates $HISTFILE to $HISTFILESIZE
# On interactive close, if the shell option histappend is set, Bash 
#   appends $HISTSIZE lines to $HISTFILE, otherwise it overwrites $HISTFILE
shopt -s histappend

# Prompt 

PS1='\W > '
#PS1='$( get_ps1 )'
#bind 'RETURN: "\C-l\C-j"'

# Exports

export TERM=xterm-256color
export EDITOR="vim"
export NVM_DIR=~/.nvm
export PATH=~/dotfiles/awk:/usr/local/opt/coreutils/libexec/gnubin:$PATH
export AWKPATH=~/dotfiles/awk
export HISTFILESIZE=
export HISTSIZE=
export SCREENRC=~/.local.screenrc

if [[ `hostname` == "toad" ]]; then
    # Source local awk (less compliant) scripts first
    export AWKPATH=~/proj/awk:$AWKPATH
fi
