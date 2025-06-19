variable "vpc_id" {
  description = "VPC ID for the EC2 and security group"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where EC2 instance will be launched"
  type        = string
}

variable "key_name" {
  description = "EC2 Key pair name"
  type        = string
}
variable "server_ip" {
  description = "EC2 Key pair name"
  type        = string
}
