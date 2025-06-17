# modules/alb/variables.tf
variable "vpc_id" {}
variable "public_subnets" { 
    type = list(string) 
    description = "List of public subnet IDs to attach to ALB"
}
variable "target_group_port" {}
