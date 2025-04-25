# Export RDS Snapshots to S3

This folder includes examples to export RDS snapshots to Amazon S3 using the AWS CLI.

## Files

- export-snapshot.sh: Command to trigger an export task
- export-role-policy.json: IAM policy for the role used to export to S3

## Requirements

- An existing snapshot
- A KMS key for encryption
- A bucket with proper permissions
- An IAM role with permissions from export-role-policy.json

## Run the export

```bash
bash export-snapshot.sh
```

## Notes

- Snapshot exports are **asynchronous**
- Files will appear in S3 once the export completes
- Exported format is Parquet (columnar), suitable for Athena and Redshift

## Use Cases

- Long-term backup storage in S3
- Compliance / archival snapshots
- Data warehousing and query offloading via Athena
