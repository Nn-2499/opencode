#!/bin/bash
set -e

echo "===== [7/7] Verification ====="

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

echo "--- Node.js ---" && node -v
echo "--- npm ---"     && npm -v
echo "--- pnpm ---"    && pnpm -v
echo "--- git ---"     && git --version

echo "--- opencode ---"
if command -v opencode >/dev/null 2>&1; then
    opencode --version
else
    echo "❌ opencode not found in PATH"
    echo "   ลอง: source ~/.bashrc แล้วรันใหม่"
    exit 1
fi

echo ""
echo "✅ All checks passed"
