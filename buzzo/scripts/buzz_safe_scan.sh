#!/data/data/com.termux/files/usr/bin/bash
mkdir -p ~/buzzo/logs ~/buzzo/nmap

RANGE="192.168.1.0/24"

echo "[🐝 Buzz Safe Scan]"
echo "[📡 Range: $RANGE]"
echo "--------------------------------"

nmap -sn "$RANGE" | tee ~/buzzo/nmap/scan_raw.txt | awk '/Nmap scan report/{print $NF}' | tee ~/buzzo/nmap/devices.txt

echo "--------------------------------"
echo "[✅ Device list saved]"
echo "~/buzzo/nmap/devices.txt"
