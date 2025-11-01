#!/bin/bash
echo "Starting bootstrap..."

# 1. Install packages
./pacman.sh

# 2. Symlink dotfiles
./setup.sh

# 3. SSH key check
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  echo "No SSH key found. Run: ssh-keygen -t ed25519 -C 'your_email@example.com'"
else
  echo "SSH key found, good to go!"
fi

echo "Bootstrap complete!"
