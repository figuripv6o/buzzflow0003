import asyncio
from bleak import BleakClient, BleakScanner
import os

TARGET_UUIDS = [
    "0000ffe1-0000-1000-8000-00805f9b34fb",
    "c65b8f2f-aee2-4c89-b758-bc4892d6f2d8",
    "0000aaa2-0000-1000-8000-aabbccddeeff"
]

BUZZ_PAYLOAD = b'\x01'

async def buzz_device(address, uuid):
    try:
        async with BleakClient(address) as client:
            print(f"🔗 Connected to {address}")
            if uuid in [str(c.uuid) for s in await client.get_services() for c in s.characteristics]:
                await client.write_gatt_char(uuid, BUZZ_PAYLOAD)
                print(f"💥 Buzz sent to {address} on {uuid}")
            else:
                print(f"❌ UUID {uuid} not found on {address}")
    except Exception as e:
        print(f"⚠️ Error with {address}: {e}")

async def scan_and_buzz():
    print("🔎 Scanning for BLE devices...")
    devices = await BleakScanner.discover(timeout=8.0)
    tasks = []
    for d in devices:
        print(f"📍 Found {d.name} @ {d.address}")
        for uuid in TARGET_UUIDS:
            tasks.append(buzz_device(d.address, uuid))
    await asyncio.gather(*tasks)

if __name__ == "__main__":
    try:
        asyncio.run(scan_and_buzz())
    except KeyboardInterrupt:
        print("🛑 Stopped by user")
