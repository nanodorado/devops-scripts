# RDS Cost Optimization

This folder contains tools to monitor, detect and reduce unnecessary RDS costs.

## ðŸ•µï¸ Detect Idle Instances

**File: \ind-idle-rds.py\**

- Lists RDS instances that are \vailable\ and might be idle
- Default filter: \db.t3.micro\, but you can extend logic with metrics

> Run manually or schedule daily in non-prod environments

## â° Schedule Shutdowns

**File: \scheduler.tf\**

- Terraform resources to create a CloudWatch rule and EventBridge target
- Designed to trigger a Lambda that stops non-critical RDS instances at night

## ðŸ’¡ Tips

- Tag your RDS instances (e.g., \Env = Dev\) and filter in automation
- Use instance type and CPU usage to determine idle criteria
- Combine with SSM automation to stop/start RDS safely

## âœ… Outcome

- Reduce unnecessary billing from dev/staging databases
- Automate savings with clean and auditable IaC
