# terraform.tfvars
aws_region        = "ap-south-1"
vpc_cidr          = "10.0.0.0/16"
public_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets   = ["10.0.11.0/24", "10.0.12.0/24"]
ecr_repo_name     = "my-app-repo"
key_pair_name     = "cactro"
ec2_key_name     = "cactro"
allowed_ssh_cidr = "49.37.45.172/32"
