# PowerShell script to create RDS parameter group management examples

$base = "rds-operations/maintenance/parameter-groups"
New-Item -ItemType Directory -Force -Path $base | Out-Null

# Terraform template for parameter group
@"
resource \"aws_db_parameter_group\" \"postgresql_params\" {
  name   = \"custom-postgres-params\"
  family = \"postgres15\"
  description = \"Custom PostgreSQL parameters\"

  parameter {
    name  = \"log_min_duration_statement\"
    value = \"500\"
    apply_method = \"immediate\"
  }

  parameter {
    name  = \"log_statement\"
    value = \"ddl\"
    apply_method = \"immediate\"
  }

  tags = {
    Environment = \"dev\"
  }
}
"@ | Out-File -Encoding UTF8 "$base/parameter-group.tf"

# README with explanation and tips
@"
# RDS Parameter Group Management

This folder provides an example for managing RDS DB parameter groups with Terraform.

## 🛠️ Why It Matters

- Controls DB engine behavior (logging, performance, memory, etc.)
- Enables advanced features like `pg_stat_statements` or fine-tuned slow query logging
- Version-controlled via IaC

## ⚙️ Example

Terraform resource: \`aws_db_parameter_group\`

Key options:

- \`log_min_duration_statement = 500\` → Log queries slower than 500ms
- \`log_statement = ddl\` → Only log DDL statements
- \`apply_method = immediate\` → Apply changes without reboot when possible

## 🔁 Tips

- Some parameters require reboot even with \`immediate\`
- Group must match the engine family (e.g. postgres15, mysql8.0)
- You can create multiple groups for different workloads (e.g. dev vs prod)

## 🔄 Lifecycle Management

- Keep track of changes using version control
- Apply parameter changes during maintenance windows for safety
- Use tagging to distinguish environments

> 🎯 Combine this with your instance declaration by attaching \`parameter_group_name\`
"@ | Out-File -Encoding UTF8 "$base/README.md"

Write-Host "✅ Parameter group management files created in '$base'"