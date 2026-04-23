#!/data/data/com.termux/files/usr/bin/bash

echo "🎤 BUZZO STORM MODE ACTIVATED — Chris Brown ATL Edition"
cd ~/buzzo || { echo "❌ BUZZO folder not found"; exit 1; }

# 🔊 20 Hours of Full BLE Buzz + ATL Voice/Moan + Mic Reactivity
nohup python3 scripts/atl_reactive_buzz.py \
  --ble \
  --voice "atl" \
  --music "chrisbrown_mix" \
  --mic-react \
  --duration 20h \
  --intensity dynamic \
  --buzzstorm \
  --voice-drops every10s \
  --moan every12s \
  --global-mesh \
  > logs/chrisbrown_storm.log 2>&1 &

echo "✅ CHRIS BROWN BUZZ STORM LAUNCHED! 20h nonstop. Let it ride, Big Daddy."
