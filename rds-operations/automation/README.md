# RDS Automation

This section contains examples for automating operational tasks in RDS, including:

## ðŸŒ€ Secret Rotation with Lambda
A Python script that connects to AWS Secrets Manager and triggers secret rotation for an RDS user. This can be scheduled using EventBridge.

- \otate-secret-lambda.py\: Lambda function to rotate RDS secret.
- Environment variables:
  - \SECRET_NAME\: Name of the secret in Secrets Manager.
  - \AWS_REGION\: Region of your RDS instance.

## ðŸ“… Snapshot Scheduling with Terraform
A scheduled snapshot example using AWS CloudWatch Events and Terraform.

- \ds-snapshot-scheduler.tf\: Creates a CloudWatch rule to take daily snapshots.
- Can be extended to notify via SNS or trigger Lambda on snapshot success.

These automation patterns reduce manual maintenance effort and improve reliability of operations in production environments.
