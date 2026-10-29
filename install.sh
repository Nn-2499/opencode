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

echo "===== Installing OpenCode ====="

curl -fsSL https://opencode.ai/v2/install | bash
npm install -g @opencode/cli

# Add OpenCode to PATH
export PATH="$HOME/.opencode/bin:$HOME/.local/bin:$PATH"

# Save PATH for future Bash sessions
if ! grep -q ".opencode/bin" "$HOME/.bashrc" 2>/dev/null; then
    echo '\''export PATH="$HOME/.opencode/bin:$HOME/.local/bin:$PATH"'\'' >> "$HOME/.bashrc"
fi

echo "===== Checking OpenCode ====="

if command -v opencode >/dev/null 2>&1; then
    opencode --version
else
    echo "OpenCode command not found. Check the installation output and PATH."
fi

echo "===== Installation completed ====="
' 