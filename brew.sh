#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Brew cask, for gui apps
brew install caskroom/cask/brew-cask

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

brew install bash
brew install ctags
brew install moreutils
brew install gnu-sed --with-default-names
brew install gawk
brew install grep --with-default-names
brew install vim --override-system-vi
brew install homebrew/dupes/screen
brew install wget
brew install git
brew install rename
brew install ssh-copy-id
brew install tree
brew install fzf
brew install ag
# graphical interface disk usage
brew install ncdu

# Remove outdated versions from the cellar.
brew cleanup
