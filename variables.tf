# variables.tf
variable "aws_region" {}
variable "vpc_cidr" {}
variable "public_subnets" { type = list(string) }
variable "private_subnets" { type = list(string) }
variable "ecr_repo_name" {}
variable "key_pair_name" {
  description = "EC2 Key Pair name for SSH access"
  type        = string
}
variable "ec2_key_name" {
  description = "EC2 Key Pair name for SSH access"
  type        = string
}
variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into the bastion host"
  type        = string
}

variable "email" {
  description = "Email to receive CloudWatch alerts"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "instance_id" {
  description = "ID of EC2 instance to monitor"
  type        = string
}

variable "app_name" {
  description = "Application name used in log group naming"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
}
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where EC2 will be launched"
  type        = string
}

variable "key_name" {
  description = "EC2 Key Pair name for SSH access"
  type        = string
}

variable "alert_email" {
  description = "Email address to send CloudWatch alerts to"
  type        = string
}

variable "server_ip" {
  description = "Private or public IP of ELK Elasticsearch server"
  type        = string
}
variable "ecr_registry" {
  description = "The url of the ecr to pull the image"
  type        = string
}