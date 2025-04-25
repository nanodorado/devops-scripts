# RDS Provisioning with Terraform

This setup provisions a PostgreSQL RDS instance using AWS best practices.

## ðŸ” Features

- Encrypted storage
- Private subnets via subnet group
- Parameterized input for region, password, and environment
- Public access disabled

## ðŸ§± Files

- \main.tf\: Defines the subnet group and DB instance
- \ariables.tf\: Input variables

## â–¶ï¸ Usage

1. Fill in your \	erraform.tfvars\:

\\\hcl
region           = \"us-east-1\"
db_password      = \"REPLACE_ME\"
private_subnets  = [\"subnet-abc\", \"subnet-def\"]
security_groups  = [\"sg-123456\"]
environment      = \"dev\"
\\\

2. Deploy:

\\\ash
terraform init
terraform plan
terraform apply
\\\

## âœ… Recommendations

- Set \multi_az = true\ for production
- Use Secrets Manager for DB credentials
- Use CloudWatch for performance monitoring
