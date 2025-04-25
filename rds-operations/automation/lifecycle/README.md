# RDS Snapshot Lifecycle Automation

This Lambda script deletes manual RDS snapshots older than a defined number of days (default: 7).

## How It Works

- Uses \oto3\ to fetch manual snapshots for a given RDS instance.
- Compares their creation date to a retention window.
- Deletes any snapshot older than that window.

## Configuration

- \RETENTION_DAYS\: How many days of snapshots to keep (default: 7)
- \INSTANCE_IDENTIFIER\: Your RDS instance identifier

## Example Usage

This function can be deployed via Lambda and scheduled using CloudWatch Events or EventBridge:

- **Schedule**: \cron(0 4 * * ? *)\ â†’ every day at 4am UTC
- **IAM Role**: Must include \
ds:DescribeDBSnapshots\ and \
ds:DeleteDBSnapshot\

## âœ… Benefits

- Keeps your snapshot storage clean and cost-effective
- Automates routine data hygiene in production and staging environments
