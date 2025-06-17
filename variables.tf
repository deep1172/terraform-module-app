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