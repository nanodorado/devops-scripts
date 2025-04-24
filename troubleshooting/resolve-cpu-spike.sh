#!/bin/bash
if [ -f /tmp/high_cpu_pid.txt ]; then
  PID=\
  echo \"ðŸ›‘ Killing high CPU process with PID: \43140\"
  kill \43140 && rm /tmp/high_cpu_pid.txt
else
  echo \"No high CPU process tracked\"
fi
