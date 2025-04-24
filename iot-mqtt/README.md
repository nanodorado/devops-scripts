# IoT + MQTT Device Simulation

This folder contains a realistic demo for simulating an IoT device that publishes sensor data to an MQTT broker using Python.

## Use Case

Simulate sending temperature and humidity data from a device to an MQTT broker (e.g., Mosquitto, AWS IoT Core) for testing ingestion pipelines, alerting, and data visualization tools.

## Files

- \device.py\: Simulates an IoT device publishing JSON data
- \equirements.txt\: Required Python packages
- \start-broker.sh\: Script to launch a local Mosquitto broker via Docker

## Setup

1. Start the local MQTT broker:
   \\\ash
   ./start-broker.sh
   \\\

2. Install Python dependencies:
   \\\ash
   pip install -r requirements.txt
   \\\

3. Run the simulated device:
   \\\ash
   python device.py
   \\\

The broker will receive JSON payloads like:
\\\json
{
  "device_id": "sensor-001",
  "temperature": 23.4,
  "humidity": 55.1,
  "timestamp": "2025-04-22T15:23:10Z"
}
\\\
