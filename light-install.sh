# This script should be sourced, not executed, so that it can affect the
# current session

# Check for git
which git &>-;
if [[ $? -ne 0 ]]; then
    echo "git is required. Exiting."
    exit 1;
fi;

# Clone the dotfiles repo if it doesn't exist
if [[ ! -d ~/dotfiles ]]; then
    git clone https://github.com/cdosborn/dotfiles.git ~/dotfiles
fi;

# Only source if we're attached to a terminal
if [[ -t 1 ]]; then
    source ~/dotfiles/conf/bashrc;
fi;
