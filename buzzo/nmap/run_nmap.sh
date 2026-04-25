#!/data/data/com.termux/files/usr/bin/bash

echo "[🔍 NMAP SCAN START]"

# Get your local IP range automatically
IP=$(ip route | grep wlan0 | awk '{print $1}' | head -n1)

echo "[📡 Scanning network: $IP]"

# Basic scan (safe)
nmap -sn $IP

echo "[🔎 Running service detection on gateway]"
GATEWAY=$(ip route | grep default | awk '{print $3}')

nmap -sV $GATEWAY

echo "[✅ NMAP SCAN COMPLETE]"
