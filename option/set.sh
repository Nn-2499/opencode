#!/data/data/com.termux/files/usr/bin/bash

set -e

# Update Termux
pkg update -y
pkg upgrade -y

# Install required packages
pkg install -y proot-distro curl ca-certificates bash

# Install Ubuntu if it is not installed
if ! proot-distro list | grep -q 'ubuntu'; then
    proot-distro install ubuntu:26.04
fi

# Run installation inside Ubuntu
proot-distro login ubuntu -- bash -c '
set -e

echo "===== Updating Ubuntu ====="
apt update
apt install -y ca-certificates curl git bash

echo "===== Installing NVM ====="
export NVM_DIR="$HOME/.nvm"

if [ ! -s "$NVM_DIR/nvm.sh" ]; then
    curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
fi

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

echo "===== Installing Node.js 24 ====="

if ! nvm ls 24 >/dev/null 2>&1; then
    nvm install 24
fi

nvm alias default 24
nvm use 24

echo "===== Enabling pnpm ====="

corepack enable
corepack prepare pnpm@latest --activate

echo "===== Checking Node.js tools ====="
node -v
npm -v
pnpm -v


'

# ===== Termux-side shortcuts & symlink =====
echo "===== Setting up Termux shortcuts ====="

# Symlink Ubuntu rootfs /root to $HOME/u_root
ln -sfn /data/data/com.termux/files/usr/var/lib/proot-distro/containers/ubuntu/rootfs/root "$HOME/u_root"

# Add aliases (avoid duplicates)
grep -qxF 'alias u="proot-distro login ubuntu"' ~/.bashrc || \
    echo 'alias u="proot-distro login ubuntu"' >> ~/.bashrc

grep -qxF 'alias c="cd ~/u_root && ls -la"' ~/.bashrc || \
    echo 'alias c="cd ~/u_root && ls -la"' >> ~/.bashrc

# Reload bashrc
source ~/.bashrc

echo "===== Done! ====="
echo "Use 'u' to login to Ubuntu, 'c' to list Ubuntu root files."
