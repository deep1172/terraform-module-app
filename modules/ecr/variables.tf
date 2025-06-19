# modules/ecr/variables.tf
variable "name_prefix" {
  description = "Prefix for naming repositories"
  type        = string
}

variable "name" {
  description = "Name for the main ECR repository"
  type        = string
}