#!/bin/bash
set -e

echo "===== [6/7] Configuring PATH ====="

export PATH="$HOME/.opencode/bin:$HOME/.local/bin:$PATH"

if ! grep -q ".opencode/bin" "$HOME/.bashrc" 2>/dev/null; then
    echo 'export PATH="$HOME/.opencode/bin:$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
    echo "Added PATH to ~/.bashrc"
else
    echo "PATH already configured in ~/.bashrc"
fi

echo "✅ PATH configured"
