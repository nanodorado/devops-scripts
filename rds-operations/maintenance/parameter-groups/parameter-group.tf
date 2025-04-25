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
