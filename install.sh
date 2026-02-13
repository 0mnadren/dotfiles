#!/usr/bin/env bash

set -e

echo "Installing dotfiles..."

ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/tmux/.tmux-cht-command ~/.tmux-cht-command
ln -sf ~/dotfiles/tmux/.tmux-cht-languages ~/.tmux-cht-languages

mkdir -p ~/.config
ln -sf ~/dotfiles/nvim ~/.config/nvim

echo "Done ✅"

