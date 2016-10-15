#!/bin/bash

# Git
cp ./.gitconfig ~/.gitconfig
# Emacs
cp ./init.el  ~/.emacs.d/init.el
# tmux
cp ./.tmux.conf ~/.tmux.conf

echo "dotfiles are configured"
