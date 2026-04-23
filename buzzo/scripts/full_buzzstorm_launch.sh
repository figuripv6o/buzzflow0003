#!/data/data/com.termux/files/usr/bin/bash

echo "[🔥 BUZZO COMMANDO MODE INITIATED 🔥]"
echo "[📡 Scanning BLE targets...]"
python3 ~/buzzo/scripts/atl_reactive_buzz.py --mode ATL-STORM --duration 20h --mic-react --voice-drops every10s --moan every12s --buzz-intensity max --auto-start --log ~/buzzo/logs/storm_log.txt &

echo "[🔁 Auto-sync to GitHub & Termux logs]"
cd ~/buzzo && git add . && git commit -m "🔥 Full Storm Buzz Activated" && git push origin main

echo "[📸 Trigger SnapCam on sound]"
python3 ~/buzzo/scripts/upload_snap.py --mode auto --sound-trigger on &

echo "[🌐 Webhook notifying command center]"
curl -X POST https://your-server.com/webhook -H "Content-Type: application/json" -d '{"event": "buzz_storm_started"}'

echo "[✅ BUZZO IS BUZZING LIVE 20H]"
