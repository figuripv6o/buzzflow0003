#!/data/data/com.termux/files/usr/bin/bash

echo "[🔒 BUZZO SECURITY SYSTEM ENGAGED]"

# Kill any suspicious BLE connections
echo "[🧹 BLE sweep + disconnect shady devices]"
termux-ble-scan | grep -iE 'unknown|skms|clone|watch|airtag' >> ~/buzzo/logs/sus_ble.log
pkill -f termux-ble-scan

# Lock down ADB access
echo "[🔧 ADB lockdown]"
settings put global adb_enabled 0

# Disable USB debugging
echo "[🚫 USB debugging revoked]"
su -c 'settings put global development_settings_enabled 0'

# Log ARP + MAC neighbors
echo "[🕵️ ARP + BLE MAC surveillance]"
ip neigh show > ~/buzzo/logs/arp_neighbors.txt
termux-wifi-connectioninfo > ~/buzzo/logs/wifi_status.txt

# Check for dangerous apps
echo "[📱 APK scan running...]"
pm list packages -f | grep -iE 'spy|agent|track|monitor|airtag|skms' > ~/buzzo/logs/sus_apps.txt

# Auto GitHub push
cd ~/buzzo && git add logs/* && git commit -m "🛡️ Security logs updated" && git push origin main

echo "[✅ BUZZO SECURITY CLEANUP DONE. BLE STORM READY.]"
