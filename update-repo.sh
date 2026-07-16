#!/bin/bash
echo "[*] Generating Packages index for stable/main..."

# Создаем папки для обеих архитектур, если их нет
mkdir -p dists/stable/main/binary-aarch64
mkdir -p dists/stable/main/binary-all

# Сканируем пакеты и генерируем индексы для aarch64
dpkg-scanpackages pool /dev/null > dists/stable/main/binary-aarch64/Packages

# Дублируем/линкуем индексы для архитектуры 'all', так как наши пакеты "Architecture: all"
cp dists/stable/main/binary-aarch64/Packages dists/stable/main/binary-all/Packages

echo "[*] Compressing Packages index to gzip..."
gzip -cf dists/stable/main/binary-aarch64/Packages > dists/stable/main/binary-aarch64/Packages.gz
gzip -cf dists/stable/main/binary-all/Packages > dists/stable/main/binary-all/Packages.gz

echo "[+] Done!"
