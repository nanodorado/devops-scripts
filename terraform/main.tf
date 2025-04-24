# Terraform configuration to provision a basic AWS environment:
# - EC2 instance
# - ECS cluster with Fargate
# - RDS PostgreSQL database
# - IAM roles, security groups, SSM integration

provider "aws" {
  region = var.aws_region
}

# ------------------------
# VPC and Networking
# ------------------------
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = "devops-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["${var.aws_region}a", "${var.aws_region}b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_dns_hostnames = true
  enable_dns_support   = true
}

# ------------------------
# EC2 Instance
# ------------------------
resource "aws_instance" "bastion" {
  ami           = var.ec2_ami
  instance_type = "t3.micro"
  subnet_id     = module.vpc.public_subnets[0]
  key_name      = var.ec2_key_name

  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  user_data = file("user_data.sh")

  tags = {
    Name = "devops-bastion"
  }
}

resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg"
  description = "Allow SSH"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ------------------------
# RDS (PostgreSQL)
# ------------------------
module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "5.0.0"

  identifier = "devops-db"
  engine     = "postgres"
  engine_version = "15.3"
  instance_class = "db.t3.micro"
  allocated_storage = 20

  name     = "devopsdb"
  username = var.db_username
  password = var.db_password
  port     = 5432

  vpc_security_group_ids = [module.vpc.default_security_group_id]
  db_subnet_group_name   = module.vpc.database_subnet_group

  skip_final_snapshot = true
}

# ------------------------
# ECS Cluster
# ------------------------
resource "aws_ecs_cluster" "main" {
  name = "devops-cluster"
}

# ------------------------
# Output
# ------------------------
output "ec2_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "rds_endpoint" {
  value = module.rds.db_instance_endpoint
}