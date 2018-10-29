#!/bin/bash

# Git
cp ~/.gitconfig ./.gitconfig
cp ~/.gitignore ./gitignore
# Emacs
cp ~/.emacs.d/init.el ./init.el
# tmux
cp ~/.tmux.conf ./.tmux.conf
# zsh
cp ~/.zshrc ./.zshrc

echo "dotfiles are saved"
