#!/bin/bash
echo "[*] Generating Packages index..."
dpkg-scanpackages . /dev/null > Packages
echo "[*] Compressing Packages index to gzip..."
gzip -c Packages > Packages.gz
echo "[+] Done!"
