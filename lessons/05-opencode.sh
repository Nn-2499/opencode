#!/bin/bash
set -e

echo "===== [5/7] Installing OpenCode ====="

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

curl -fsSL https://opencode.ai/v2/install | bash
npm install -g @opencode/cli

echo "✅ OpenCode installed"
