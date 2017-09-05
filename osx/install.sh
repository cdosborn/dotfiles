#! /bin/bash

# Set up defaults
~/dotfiles/osx/defaults.sh

# Link emacs key bindings
if [ ! -d ~/Library/KeyBindings ]; then
    mkdir ~/Library/KeyBindings
fi
ln -sf ~/dotfiles/osx/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict
