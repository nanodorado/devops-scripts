import paho.mqtt.client as mqtt
import json
import time
import random
from datetime import datetime

BROKER = "localhost"
PORT = 1883
TOPIC = "iot/sensors"

client = mqtt.Client("iot-simulator")
client.connect(BROKER, PORT, 60)

device_id = "sensor-001"

print(f"ðŸ“¡ Publishing messages to {BROKER}:{PORT} on topic '{TOPIC}'")

while True:
    payload = {
        "device_id": device_id,
        "temperature": round(random.uniform(20.0, 30.0), 2),
        "humidity": round(random.uniform(40.0, 60.0), 2),
        "timestamp": datetime.utcnow().isoformat() + "Z"
    }
    client.publish(TOPIC, json.dumps(payload))
    print(f"âž¡ï¸  Sent: {payload}")
    time.sleep(5)
