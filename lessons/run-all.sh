#!/bin/bash
set -e

cd "$(dirname "$0")"

for step in 01-base.sh 02-nvm.sh 03-node.sh 04-pnpm.sh 05-opencode.sh 06-path.sh; do
    echo ""
    echo "▶️  Running $step"
    bash "$step"
done

source "$HOME/.bashrc"
bash 07-verify.sh
