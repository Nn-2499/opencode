#!/bin/bash
set -e

echo "=== [1/2] Installing Bun ==="

if command -v bun &> /dev/null; then
    echo "⚠️  Bun is already installed. Version: $(bun --version)"
else
    # ใช้ official installer (แนะนำ - ไม่ต้องใช้ sudo)
    curl -fsSL https://bun.sh/install | bash
    echo "✅ Bun downloaded and installed."

    # โหลด PATH สำหรับ session ปัจจุบัน (หลังติดตั้ง)
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"

    # fallback: ถ้า curl installer ล้มเหลวและหา bun ไม่เจอ ให้ลองใช้ npm
    if ! command -v bun &> /dev/null; then
        echo "⚠️  Official installer failed, trying npm..."
        if command -v npm &> /dev/null; then
            npm install -g bun
            echo "✅ Bun installed via npm."
        else
            echo "❌ npm not found. Please install Node.js/npm first."
            exit 1
        fi
    fi
fi

echo "=== [2/2] Configuring PATH ==="

# ตรวจสอบว่ามีการตั้งค่า Bun ใน .bashrc หรือยัง
if ! grep -q "BUN_INSTALL" ~/.bashrc 2>/dev/null; then
    echo '' >> ~/.bashrc
    echo '# Bun' >> ~/.bashrc
    echo 'export BUN_INSTALL="$HOME/.bun"' >> ~/.bashrc
    echo 'export PATH="$BUN_INSTALL/bin:$PATH"' >> ~/.bashrc
    echo "✅ Added Bun to ~/.bashrc"
else
    echo "⚠️  Bun PATH already configured."
fi

# โหลด PATH สำหรับ session ปัจจุบัน
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ตรวจสอบผลลัพธ์สุดท้าย
if command -v bun &> /dev/null; then
    echo "🎉 Bun ready! Version: $(bun --version)"
    echo "ℹ️  Run 'source ~/.bashrc' or open a new terminal to use bun in other sessions."
else
    echo "❌ Bun not found in PATH. Please check installation."
    exit 1
fi