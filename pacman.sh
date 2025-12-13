#!/bin/bash
# pacman.sh - installs essential packages on Arch Linux

echo "Updating system and installing packages with pacman..."

# Update system
sudo pacman -Syu --noconfirm

# Install core packages
sudo pacman -S --noconfirm \
  git \
  net-tools \
  vim \
  neovim \
  tmux \
  zsh \
  wget \
  curl \
  base-devel \
  htop \
  unzip \
  python \
  python-pip \
  openssh \
  fzf \
  go \
  docker \
  docker-compose

# Enable Docker service
sudo systemctl enable docker.service
sudo systemctl start docker.service

# Add current user to docker group (so no sudo needed)
sudo usermod -aG docker $USER
echo "Run 'newgrp docker' or log out/in to apply Docker group changes."

# Optional: install yay for AUR packages if not installed
if ! command -v yay &> /dev/null; then
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay
  makepkg -si --noconfirm
  cd -
  rm -rf /tmp/yay
fi

echo "Pacman installation complete!"
