variable \"region\" {
  description = \"AWS region\"
  type        = string
}

variable \"db_password\" {
  description = \"Master password for the RDS instance\"
  type        = string
  sensitive   = true
}

variable \"private_subnets\" {
  description = \"List of private subnet IDs\"
  type        = list(string)
}

variable \"security_groups\" {
  description = \"List of security group IDs\"
  type        = list(string)
}

variable \"environment\" {
  description = \"Environment tag\"
  type        = string
}
