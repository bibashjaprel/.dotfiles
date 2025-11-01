
# 📁 DOTFILES

Personal dotfiles managed by **Bibash Japrel** for configuration management and portability.

---
## Clone The Repository

```bash
  git clone https://github.com/bibashjaprel/.dotfiles
```

OR VIa `SSH`

```bash
git clone git@github.com:bibashjaprel/.dotfiles.git
```

## ⚡ Automated Setup
pacman.sh – Installs essential packages like git, vim, zsh, go, docker, and docker-compose.
setup.sh – Creates symbolic links from your dotfiles in ~/.dotfiles to your home directory.
bootstrap.sh – Main script that runs pacman.sh and setup.sh, and checks for SSH keys.

```bash
cd ~/.dotfiles
chmod +x *.sh          # Make scripts executable
./bootstrap.sh          # Run full setup
```

## 🛠 To Manually Create Symlinks

You can manually create symbolic links if needed:
```bash
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.inputrc ~/.inputrc
ln -s ~/.dotfiles/.gitignore ~/.gitignore

```

---
