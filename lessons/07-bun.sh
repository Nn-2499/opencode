#!/bin/bash
set -e

pkg update && yes | pkg upgrade -y
pkg install -y git curl nodejs-lts npm
npm install -g bun
pkg update && yes | pkg upgrade -y
pkg install bun -y

echo 'export BUN_INSTALL="$HOME/.bun"' >> ~/.bashrc
echo 'export PATH="$BUN_INSTALL/bin:$PATH"' >> ~/.bashrc

source ~/.bashrc


bun --revision