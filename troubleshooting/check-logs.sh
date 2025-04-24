#!/bin/bash
echo \"ðŸ“ Checking system logs:\"
journalctl -p err -n 20
echo \"\"
echo \"ðŸ” Docker logs (if running):\"
docker ps -q | xargs -I{} docker logs --tail 10 {}
