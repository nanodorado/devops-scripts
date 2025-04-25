# Export RDS snapshot to S3
aws rds start-export-task \\
  --export-task-identifier export-task-1 \\
  --source-arn arn:aws:rds:us-east-1:123456789012:snapshot:rds-snapshot-id \\
  --s3-bucket-name my-export-bucket \\
  --iam-role-arn arn:aws:iam::123456789012:role/RDSExportToS3Role \\
  --kms-key-id arn:aws:kms:us-east-1:123456789012:key/my-kms-key-id \\
  --region us-east-1
