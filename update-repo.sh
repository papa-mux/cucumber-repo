#!/bin/bash
echo "[*] Generating Packages index for stable/main..."
# Сканируем pool, но пути в индексе будут считаться от корня репозитория
dpkg-scanpackages pool/main /dev/null > dists/stable/main/binary-aarch64/Packages

echo "[*] Compressing Packages index to gzip..."
gzip -c dists/stable/main/binary-aarch64/Packages > dists/stable/main/binary-aarch64/Packages.gz

echo "[+] Done!"
