#!/data/data/com.termux/files/usr/bin/bash

echo "🌪️ BUZZO ULTRA STORM MODE — 20H ATL FUNK INITIATED"

cd ~/buzzo || { echo "❌ BUZZO folder missing"; exit 1; }

# Ensure logs folder
mkdir -p logs

# Run ATL BUZZ STORM with full sound-reactive input
nohup python3 scripts/atl_reactive_buzz.py \
  --ble \
  --voice "atl" \
  --music "chrisbrown_mix" \
  --mic-react \
  --intensity dynamic \
  --buzzstorm \
  --duration 20h \
  --trigger snap crackle pop sniff slap stomp bump voice water fan \
  --voice-drops every10s \
  --moan every12s \
  --snap-on-moan \
  --log \
  --global-mesh \
  > logs/buzzo_ultra_storm.log 2>&1 &

echo "✅ BUZZO ULTRA STORM is LIVE for 20 HOURS. Every sound = harder BUZZ. Photos and logs activated."
