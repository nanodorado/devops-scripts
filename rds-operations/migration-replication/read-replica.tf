resource \"aws_db_instance\" \"read_replica\" {
  replicate_source_db = \"my-production-db-instance\"
  instance_class       = \"db.t3.medium\"
  publicly_accessible  = false
  availability_zone    = \"us-east-1b\"
  tags = {
    Name = \"my-rds-replica\"
  }
}
