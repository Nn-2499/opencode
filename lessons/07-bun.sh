#!/bin/bash
set -e

echo "=== [1/2] Installing Bun ==="

if command -v bun &> /dev/null; then
    echo "⚠️ Bun is already installed. Version: $(bun --version)"
else
    # ใช้ official installer
    curl -fsSL https://bun.sh/install | bash
    # ใช้​ npm
    npm install -g bun
    echo "✅ Bun downloaded and installed."
fi

echo "=== [2/2] Configuring PATH ==="

# ตรวจสอบว่ามีการตั้งค่า Bun ใน .bashrc หรือยัง
if ! grep -q "BUN_INSTALL" ~/.bashrc 2>/dev/null; then
    echo 'export BUN_INSTALL="$HOME/.bun"' >> ~/.bashrc
    echo 'export PATH="$BUN_INSTALL/bin:$PATH"' >> ~/.bashrc
    echo "✅ Added Bun to ~/.bashrc"
else
    echo "⚠️ Bun PATH already configured."
fi

# โหลด PATH สำหรับ session ปัจจุบัน
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"