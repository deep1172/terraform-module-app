# terraform.tfvars
aws_region        = "ap-south-1"
vpc_cidr          = "10.0.0.0/16"
public_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets   = ["10.0.11.0/24", "10.0.12.0/24"]
ecr_repo_name     = "my-app-repo"
key_pair_name     = "cactro"
ec2_key_name     = "cactro"
allowed_ssh_cidr = "49.37.45.172/32"
email        = "1172dipu@gmail.com"
name_prefix  = "blog"
instance_id  = "i-04012985374f98364"  
app_name     = "blog-app"
ami_id       = "ami-0f918f7e67a3323f0"


# Shared values
vpc_id       = "vpc-03d4502b91d50aa27"
subnet_id    = "subnet-04ef4cef25b57dddb"
key_name     = "cactro"
alert_email  = "1172dipu@gmail.com"

# For Fluent Bit
server_ip = "10.0.1.25" 
 
ecr_registry   = "486991249088.dkr.ecr.ap-south-1.amazonaws.com"