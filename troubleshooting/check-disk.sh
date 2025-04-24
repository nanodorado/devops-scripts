#!/bin/bash
echo \"ðŸ§® Disk usage:\"
df -h
echo \"\"
echo \"ðŸ” Top 10 largest files:\"
du -ah / | sort -rh | head -n 10
