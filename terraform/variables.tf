variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "ec2_ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 (example)
}

variable "ec2_key_name" {
  description = "Key pair name for SSH access to EC2"
  type        = string
}

variable "db_username" {
  description = "Username for RDS database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Password for RDS database"
  type        = string
  sensitive   = true
}