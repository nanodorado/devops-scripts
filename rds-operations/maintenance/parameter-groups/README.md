# RDS Parameter Group Management

This folder provides an example for managing RDS DB parameter groups with Terraform.

## ðŸ› ï¸ Why It Matters

- Controls DB engine behavior (logging, performance, memory, etc.)
- Enables advanced features like pg_stat_statements or fine-tuned slow query logging
- Version-controlled via IaC

## âš™ï¸ Example

Terraform resource: \ws_db_parameter_group\

Key options:

- \log_min_duration_statement = 500\ â†’ Log queries slower than 500ms
- \log_statement = ddl\ â†’ Only log DDL statements
- \pply_method = immediate\ â†’ Apply changes without reboot when possible

## ðŸ” Tips

- Some parameters require reboot even with \immediate\
- Group must match the engine family (e.g. postgres15, mysql8.0)
- You can create multiple groups for different workloads (e.g. dev vs prod)

## ðŸ”„ Lifecycle Management

- Keep track of changes using version control
- Apply parameter changes during maintenance windows for safety
- Use tagging to distinguish environments

> ðŸŽ¯ Combine this with your instance declaration by attaching \parameter_group_name\
