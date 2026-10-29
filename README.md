# Opencode-ai - Termux && Proot-distro 

<div align="center">
<img src="https://img.shields.io/badge/OpenCode-Installer-6366F1?style=for-the-badge&logo=terminal&logoColor=white" alt="OpenCode Installer"/>

# 🚀 OpenCode Installer
**ติดตั้ง OpenCode บน Android (Termux) ด้วยคำสั่งเดียว — พร้อม Ubuntu + Node.js 24 + pnpm**

[![Platform](https://img.shields.io/badge/Platform-Termux%20%7C%20Android-3DDC84?style=flat-square&logo=android&logoColor=white)](https://termux.dev)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-26.04-E95420?style=flat-square&logo=ubuntu&logoColor=white)](https://ubuntu.com)
[![Node.js](https://img.shields.io/badge/Node.js-24.x-339933?style=flat-square&logo=nodedotjs&logoColor=white)](https://nodejs.org)
[![pnpm](https://img.shields.io/badge/pnpm-latest-F69220?style=flat-square&logo=pnpm&logoColor=white)](https://pnpm.io)
[![License](https://img.shields.io/badge/License-MIT-8B5CF6?style=flat-square)](LICENSE)

[📥 ติดตั้งเลย](#-quick-install) • [✨ คุณสมบัติ](#-features) • [🧭 วิธีใช้](#-usage) • [🛠️ แก้ปัญหา](#-troubleshooting)
</div>

---
## 🚀 Quick Install 🔸 
```bash
curl -fsSL https://raw.githubusercontent.com/Nn-2499/opencode/main/install.sh | bash 
```
## เข้าใช้งาน OpenCode 🔹​
```bash
proot-distro login ubuntu 
```
```bash
opencode
```
## เพิ่มเติมหลังวางคำสั่งด้านล่างนี้ลงในฝั่ง(netive termux)+พิมพ์ ls หรือ (c)🔸จะเห็นโฟเดอร์ "u_root" ใน (Ubuntu) สำหรับแก้ไฟล์ (Manual) และเข้า ubuntu ด้วย(u)🔹 
```bash
ln -s /data/data/com.termux/files/usr/var/lib/proot-distro/containers/ubuntu/rootfs/root $HOME/u_root
echo 'alias u="proot-distro login ubuntu"' >> ~/.bashrc
echo 'alias c="cd ~/u_root && ls -la"' >> ~/.bashrc
source ~/.bashrc
```
---
📄 License
Distributed under the MIT License — ดูรายละเอียดใน LICENSE
---


