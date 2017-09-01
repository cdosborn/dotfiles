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

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install ubuntu packages
if [[ `uname -v` =~ Ubuntu ]]; then
    ~/dotfiles/ubuntu/apt-install.sh
fi

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
    ln -sf $file /usr/local/bin/$name
done

# Install vim
mkdir -p ~/.vim ~/.vim/backups ~/.vim/swaps ~/.vim/undo ~/.vim/colors ~/.vim/autoload
for file in ~/dotfiles/vim/autoload/*; do
    name=`basename $file`
    ln -sf $file ~/.vim/autoload/$name
done
for file in ~/dotfiles/vim/colors/*; do
    name=`basename $file`
    ln -sf $file ~/.vim/colors/$name
done
curl -sSLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/b44ea685aa2899316e58cba646095fa7551f8808/plug.vim

# Install ubuntu packages
if [[ `uname -v` =~ Ubuntu ]]; then
    source ~/dotfiles/ubuntu/install.sh
fi

# Install osx packages
if [[ `uname -v` =~ Darwin ]]; then
    source ~/dotfiles/osx/install.sh
fi

# Only source if we're attached to a terminal
if [[ -t 1 ]]; then
    source ~/dotfiles/conf/bashrc;
fi;
