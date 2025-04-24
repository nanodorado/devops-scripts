# PowerShell script to create a simulated IoT + MQTT device project

$baseDir = "iot-mqtt"
New-Item -ItemType Directory -Force -Path $baseDir | Out-Null

# README.md
@"
# IoT + MQTT Device Simulation

This folder contains a realistic demo for simulating an IoT device that publishes sensor data to an MQTT broker using Python.

## Use Case

Simulate sending temperature and humidity data from a device to an MQTT broker (e.g., Mosquitto, AWS IoT Core) for testing ingestion pipelines, alerting, and data visualization tools.

## Files

- \`device.py\`: Simulates an IoT device publishing JSON data
- \`requirements.txt\`: Required Python packages
- \`start-broker.sh\`: Script to launch a local Mosquitto broker via Docker

## Setup

1. Start the local MQTT broker:
   \`\`\`bash
   ./start-broker.sh
   \`\`\`

2. Install Python dependencies:
   \`\`\`bash
   pip install -r requirements.txt
   \`\`\`

3. Run the simulated device:
   \`\`\`bash
   python device.py
   \`\`\`

The broker will receive JSON payloads like:
\`\`\`json
{
  "device_id": "sensor-001",
  "temperature": 23.4,
  "humidity": 55.1,
  "timestamp": "2025-04-22T15:23:10Z"
}
\`\`\`
"@ | Out-File -Encoding UTF8 "$baseDir\README.md"

# device.py
@"
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

print(f"📡 Publishing messages to {BROKER}:{PORT} on topic '{TOPIC}'")

while True:
    payload = {
        "device_id": device_id,
        "temperature": round(random.uniform(20.0, 30.0), 2),
        "humidity": round(random.uniform(40.0, 60.0), 2),
        "timestamp": datetime.utcnow().isoformat() + "Z"
    }
    client.publish(TOPIC, json.dumps(payload))
    print(f"➡️  Sent: {payload}")
    time.sleep(5)
"@ | Out-File -Encoding UTF8 "$baseDir\device.py"

# start-broker.sh
@"
#!/bin/bash
echo "🚀 Starting Mosquitto MQTT broker on localhost:1883..."
docker run -it -d -p 1883:1883 --name mosquitto eclipse-mosquitto
"@ | Out-File -Encoding UTF8 "$baseDir\start-broker.sh"

# requirements.txt
@"
paho-mqtt==1.6.1
"@ | Out-File -Encoding UTF8 "$baseDir\requirements.txt"

Write-Host "✅ IoT + MQTT simulation folder created successfully in 'iot-mqtt/'"