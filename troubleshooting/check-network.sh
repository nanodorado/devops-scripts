#!/bin/bash
echo \"ðŸŒ Active connections:\"
ss -tulnp
echo \"\"
echo \"ðŸŒ Public IP:\"
curl -s https://checkip.amazonaws.com
