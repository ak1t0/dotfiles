#!/bin/bash

# Git
cp ./.gitconfig ~/.gitconfig
# Emacs
cp ./init.el  ~/.emacs.d/init.el
cp ./custom.el  ~/.emacs.d/custom.el
# tmux
cp ./.tmux.conf ~/.tmux.conf
# zsh
cp ./.zshrc ~/.zshrc

echo "dotfiles are configured"
