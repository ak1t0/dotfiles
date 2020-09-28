#!/bin/bash

# Git
cp ~/.gitconfig ./git/.gitconfig
cp ~/.gitignore ./git/.gitignore
# Emacs
cp ~/.emacs.d/init.el ./emacs/init.el
cp ~/.emacs.d/emacs/*.el ./emacs/emacs
# tmux
cp ~/.tmux.conf ./tmux/.tmux.conf
# zsh
cp ~/.zshrc ./zsh/.zshrc

echo "dotfiles are pulled"
