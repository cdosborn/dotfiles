# Print each command as its run
set -x

# Ask for the administrator password upfront
sudo -v

# Keep updating existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install git prerequisite
which git &>/dev/null;
if [[ $? -ne 0 ]]; then
    # Install git
    if [[ `uname -v` =~ Ubuntu ]]; then
        apt-get -qq install git;
    else
        echo "git is required. Exiting."
        exit 1;
    fi;
fi;

# Clone the dotfiles repo if it doesn't exist
if [[ ! -d ~/dotfiles ]]; then
    git clone https://github.com/cdosborn/dotfiles.git ~/dotfiles
fi;

# Clone the dotfiles repo if it doesn't exist
if [[ ! -d ~/dotfiles ]]; then
    git clone https://github.com/cdosborn/dotfiles.git ~/dotfiles
fi;

# Symlink conf files
for file in ~/dotfiles/conf/*; do
    name=`basename $file`
    ln -sf $file ~/.$name
done

# Symlink scripts into /usr/local/bin
for file in ~/dotfiles/scripts/*; do
    name=`basename $file`
    sudo ln -sf $file /usr/local/bin/$name
done

# Install git-graph
if [ ! -d ~/dotfiles/git-graph ]; then
    git clone git@github.com:cdosborn/git-graph.git ~/dotfiles/git-graph
    sudo ln -sf ~/dotfiles/git-graph/git-graph /usr/local/bin/git-graph
fi

# Create task directory for t function to use
mkdir ~/.tasks;

# Prepare vim install
mkdir -p ~/.vim/colors ~/.vim/autoload
for file in ~/dotfiles/vim/autoload/*; do
    name=`basename $file`
    ln -sf $file ~/.vim/autoload/$name
done
for file in ~/dotfiles/vim/colors/*; do
    name=`basename $file`
    ln -sf $file ~/.vim/colors/$name
done

# Install ubuntu packages
if [[ `uname -v` =~ Ubuntu ]]; then
    source ~/dotfiles/ubuntu/install.sh
fi

# Install osx packages
if [[ `uname -v` =~ Darwin ]]; then
    source ~/dotfiles/osx/install.sh
fi

# Install tmux package manager
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Only source if we're attached to a terminal
if [[ -t 1 ]]; then
    source ~/dotfiles/conf/bashrc;
fi;
