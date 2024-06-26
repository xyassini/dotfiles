#!/bin/bash

# Fish
mkdir -p "$HOME/.config/fish_bak"
mv "$HOME/.config/fish" "$HOME/.config/fish_bak"
ln -s "$(pwd)/fish" "$HOME/.config"

# Nvim
mkdir -p "$HOME/.config/nvim_bak"
mv "$HOME/.config/nvim" "$HOME/.config/nvim_bak"
ln -s "$(pwd)/nvim" "$HOME/.config"

# Zed
mkdir -p "$HOME/.config/zed_bak"
mv "$HOME/.config/zed" "$HOME/.config/zed_bak"
ln -s "$(pwd)/zed" "$HOME/.config"

if [[ "$OSTYPE" == "darwin"* ]]; then
  # iTerm2
  ln -s "$(pwd)/iterm2/com.googlecode.iterm2.plist" "$HOME/.config/iterm2/com.googlecode.iterm2.plist"
fi
