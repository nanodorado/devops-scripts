# RDS Engine Upgrade Automation

This section helps plan and apply RDS engine upgrades via Terraform.

## Example: PostgreSQL Upgrade

In upgrade.tf:
- Set engine_version = "15.4" or desired version.
- Use apply_immediately = false for controlled rollout (typically during maintenance window).
- Set to 	rue if testing manually or in dev.

## Pre-Upgrade Checklist

- Review AWS documentation for supported upgrade paths.
- Take a **manual snapshot** before upgrading.
- Verify parameter group compatibility with new version.
- Test application compatibility in staging before applying in production.
- Monitor CloudWatch during and after upgrade (connections, CPU, IOPS).

## Rollback

If something fails:
- Restore from the latest snapshot
- Redeploy the previous engine version

## Benefits

- Controlled and repeatable upgrades using IaC
- Safer rollouts with better visibility
- Avoid unexpected downtime by managing versions explicitly
