import time, os
from datetime import datetime

def send_mqtt_buzz(level="high"):
    print(f"MQTT buzz sent at level: {level}")

def check_power_trigger():
    return False

MOAN_INTERVAL = 12
VOICE_INTERVAL = 10
DURATION = 60  # 1-minute test

def play_voice_drop():
    os.system("termux-media-player play voices/atl_drop.mp3")

def play_moan():
    os.system("termux-media-player play voices/moan.mp3")

def buzz():
    send_mqtt_buzz(level="high")

def log(event):
    with open("buzzstorm.log", "a") as f:
        f.write(f"[{datetime.now()}] {event}\n")

start_time = time.time()
next_moan = start_time + MOAN_INTERVAL
next_voice = start_time + VOICE_INTERVAL

log("🔥 BuzzStorm Activated")

while time.time() - start_time < DURATION:
    if time.time() >= next_moan:
        play_moan()
        next_moan += MOAN_INTERVAL

    if time.time() >= next_voice:
        play_voice_drop()
        buzz()
        next_voice += VOICE_INTERVAL

    if check_power_trigger():
        log("⚡ POWER BOOST")
        buzz()

    time.sleep(1)
