resource "aws_db_instance" "main" {
  identifier              = "my-rds-instance"
  engine                  = "postgres"
  engine_version          = "15.4"
  instance_class          = "db.t3.medium"
  allocated_storage       = 20
  db_subnet_group_name    = aws_db_subnet_group.default.name
  publicly_accessible     = false
  multi_az                = true
  auto_minor_version_upgrade = false
  apply_immediately       = false  # use true for testing upgrades immediately

  tags = {
    Name = "engine-upgrade-demo"
  }
}
