# RDS Failover Testing

This section contains scripts and guidance for simulating failover events on Multi-AZ RDS instances.

## ðŸ› ï¸ Use Case

Force a failover to:
- Validate high availability and automatic recovery
- Test application retry logic and reconnect handling
- Measure time-to-recovery for monitoring/alerting tools

## ðŸ”§ How to Use

Run the following command (replace identifiers as needed):

\\\ash
aws rds reboot-db-instance \\
  --db-instance-identifier my-rds-instance \\
  --force-failover \\
  --region us-east-1
\\\

> Note: This only works for **Multi-AZ enabled** RDS instances.

## ðŸ§ª Suggested Checks After Failover

- Check app logs for errors during failover window
- Verify DB connections re-establish automatically
- Validate CloudWatch alarms (CPU dip, connection drops)
- Check CloudTrail for failover event

## âš ï¸ Caution

Only run in non-production or maintenance windows unless you're explicitly testing HA in production.
