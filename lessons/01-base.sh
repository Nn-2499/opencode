#!/bin/bash
set -e

echo "===== [1/7] Updating Ubuntu ====="
apt update
apt install -y ca-certificates curl git bash

echo "✅ Base packages installed"
