#!/usr/bin/env bash

set -e

# Get the directory where this script is located
DOTFILES_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

echo "Installing dotfiles from $DOTFILES_DIR..."

# 1. Create necessary directories
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/bin"

# 2. Link Tmux configuration
ln -sf "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES_DIR/tmux/.tmux-cht-command" "$HOME/.tmux-cht-command"
ln -sf "$DOTFILES_DIR/tmux/.tmux-cht-languages" "$HOME/.tmux-cht-languages"

# 3. Link Neovim (Clean old dir first to avoid nesting)
rm -rf "$HOME/.config/nvim"
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# 4. Link Scripts (ts and cht)
echo "Linking scripts to ~/.local/bin..."
ln -sf "$DOTFILES_DIR/config/ts" "$HOME/.local/bin/ts"
ln -sf "$DOTFILES_DIR/config/cht" "$HOME/.local/bin/cht"

# Ensure they are executable
chmod +x "$DOTFILES_DIR/config/ts"
chmod +x "$DOTFILES_DIR/config/cht"

echo "Done ✅"
