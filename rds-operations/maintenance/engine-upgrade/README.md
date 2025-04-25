# RDS Engine Upgrade Automation

This section helps plan and apply RDS engine upgrades via Terraform.

## âš™ï¸ Example: PostgreSQL Upgrade

In \upgrade.tf\:
- Set \engine_version = "15.4"\ or desired version.
- Use \pply_immediately = false\ for controlled rollout (typically during maintenance window).
- Set to \	rue\ if testing manually or in dev.

## ðŸ“ Pre-Upgrade Checklist

- Review AWS documentation for supported upgrade paths.
- Take a **manual snapshot** before upgrading.
- Verify parameter group compatibility with new version.
- Test application compatibility in staging before applying in production.
- Monitor CloudWatch during and after upgrade (connections, CPU, IOPS).

## ðŸ”„ Rollback

If something fails:
- Restore from the latest snapshot
- Redeploy the previous engine version

## âœ… Benefits

- Controlled and repeatable upgrades using IaC
- Safer rollouts with better visibility
- Avoid unexpected downtime by managing versions explicitly

> ðŸš¨ You cannot downgrade RDS once upgraded â€” test first!
