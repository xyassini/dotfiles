#!/bin/bash

ln -s "$(pwd)/fish" "$HOME/.config"
ln -s "$(pwd)/nvim" "$HOME/.config"

if [[ "$OSTYPE" == "darwin"* ]]; then
  ln -s "$(pwd)/iterm2/com.googlecode.iterm2.plist" "$HOME/.config/iterm2/com.googlecode.iterm2.plist"
fi

if [[ "$OSTYPE" == "linux"* ]]; then
  ln -s "$(pwd)/i3" "$HOME/.config"
  ln -s "$(pwd)/kitty" "$HOME/.config"
fi


