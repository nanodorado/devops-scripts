#Force a failover for RDS (Multi-AZ enabled instance)
aws rds reboot-db-instance
  --db-instance-identifier my-rds-instance
  --force-failover
  --region us-east-1
