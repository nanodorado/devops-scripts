#!/bin/bash
echo \"ðŸ“Š Simulating high CPU load for testing\"
yes > /dev/null &
echo \"PID: \$!\" > /tmp/high_cpu_pid.txt
