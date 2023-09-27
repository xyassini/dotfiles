#!/bin/bash

mkdir -p "$HOME/.config/fish_bak"
mv "$HOME/.config/fish" "$HOME/.config/fish_bak"
ln -s "$(pwd)/fish" "$HOME/.config"
mkdir -p "$HOME/.config/nvim_bak"
mv "$HOME/.config/nvim" "$HOME/.config/nvim_bak"
ln -s "$(pwd)/nvim" "$HOME/.config"

if [[ "$OSTYPE" == "darwin"* ]]; then
  ln -s "$(pwd)/iterm2/com.googlecode.iterm2.plist" "$HOME/.config/iterm2/com.googlecode.iterm2.plist"
fi

if [[ "$OSTYPE" == "linux"* ]]; then
  mkdir -p "$HOME/.config/hypr_bak"
  mv "$HOME/.config/hypr" "$HOME/.config/hypr_bak"
  ln -s "$(pwd)/hypr" "$HOME/.config"
  mkdir -p "$HOME/.config/kitty_bak"
  mv "$HOME/.config/kitty" "$HOME/.config/kitty_bak"
  ln -s "$(pwd)/kitty" "$HOME/.config"
  mkdir -p "$HOME/.config/rofi_bak"
  mv "$HOME/.config/rofi" "$HOME/.config/rofi_bak"
  ln -s "$(pwd)/rofi" "$HOME/.config"
  mkdir -p "$HOME/.config/waybar"
  mv "$HOME/.config/waybar" "$HOME/.config/waybar_bak"
  ln -s "$(pwd)/waybar" "$HOME/.config"
fi


