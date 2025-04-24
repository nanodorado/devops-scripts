#!/bin/bash
echo "ðŸš€ Starting Mosquitto MQTT broker on localhost:1883..."
docker run -it -d -p 1883:1883 --name mosquitto eclipse-mosquitto
