# modules/ec2-asg/variables.tf
variable "vpc_id" {}
variable "private_subnets" { type = list(string) }
variable "alb_target_group_arn" {}
variable "iam_instance_profile" {}
variable "ecr_repo_url" {}
variable "aws_region" {}
variable "ec2_key_name" {
  description = "The name of the EC2 key pair to use for SSH"
  type        = string
}
variable "bastion_sg_id" {}