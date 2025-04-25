provider \"aws\" {
  region = var.region
}

resource \"aws_db_subnet_group\" \"default\" {
  name       = \"rds-subnet-group\"
  subnet_ids = var.private_subnets
  tags = {
    Name = \"rds-subnet-group\"
  }
}

resource \"aws_db_instance\" \"postgres\" {
  identifier             = \"myapp-db\"
  engine                 = \"postgres\"
  engine_version         = \"15.4\"
  instance_class         = \"db.t3.medium\"
  allocated_storage      = 20
  storage_encrypted      = true
  username               = \"admin\"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = var.security_groups
  multi_az               = false
  skip_final_snapshot    = true
  publicly_accessible    = false
  tags = {
    Environment = var.environment
  }
}
