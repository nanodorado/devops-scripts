# ðŸ”§ Troubleshooting Scripts

This folder contains useful bash scripts to simulate and resolve common production issues on Linux-based EC2 or container environments.

## Scripts Included

- \cpu-spike.sh\: Simulates a CPU spike for monitoring/alert testing
- \esolve-cpu-spike.sh\: Kills the simulated high CPU process
- \check-disk.sh\: Shows disk usage and largest files
- \check-network.sh\: Lists open ports and public IP
- \check-logs.sh\: Outputs recent system and container logs

## Usage

\\\ash
chmod +x *.sh
./check-disk.sh
\\\

These scripts are useful for root cause analysis, monitoring validation, and interview demonstrations.
