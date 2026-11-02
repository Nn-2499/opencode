#!/bin/bash
set -e

echo "===== [4/7] Enabling pnpm ====="

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

corepack enable
corepack prepare pnpm@latest --activate

echo "✅ pnpm enabled"
