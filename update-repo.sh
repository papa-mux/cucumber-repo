#!/bin/bash
echo "[*] Generating Packages index for stable/main..."

# Сканируем pool, передавая /dev/null вместо файла оверрайдов
dpkg-scanpackages pool /dev/null > dists/stable/main/binary-aarch64/Packages

echo "[*] Compressing Packages index to gzip..."
gzip -c dists/stable/main/binary-aarch64/Packages > dists/stable/main/binary-aarch64/Packages.gz

echo "[+] Done!"
