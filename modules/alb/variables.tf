# modules/alb/variables.tf
variable "vpc_id" {}
variable "public_subnets" { type = list(string) }
variable "target_group_port" {}
