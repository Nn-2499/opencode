#!/bin/bash
set -e

echo "===== [3/7] Installing Node.js 24 ====="

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

if ! nvm ls 24 >/dev/null 2>&1; then
    nvm install 24
else
    echo "Node 24 already installed"
fi

nvm alias default 24
nvm use 24

echo "✅ Node.js ready"
