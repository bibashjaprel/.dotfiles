#!/bin/bash
DOTFILES_DIR="$HOME/.dotfiles"

FILES=(
  ".bashrc"
  ".gitconfig"
  ".inputrc"
  ".gitignore"
  # ".vimrc"
  # ".tmux.conf"
)

for file in "${FILES[@]}"; do
  TARGET="$HOME/$file"
  SOURCE="$DOTFILES_DIR/$file"

  if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
    mv "$TARGET" "$TARGET.backup"
  fi

  ln -s "$SOURCE" "$TARGET"
done
