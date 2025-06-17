module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr           = var.vpc_cidr
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  aws_region         = var.aws_region
}

module "ecr" {
  source = "./modules/ecr"
  name   = var.ecr_repo_name
}

module "iam" {
  source = "./modules/iam"
}

module "alb" {
  source              = "./modules/alb"
  vpc_id              = module.vpc.vpc_id
  public_subnets      = module.vpc.public_subnet_ids
  target_group_port   = 80
}

module "ec2_asg" {
  source              = "./modules/ec2-asg"
  vpc_id              = module.vpc.vpc_id
  private_subnets     = module.vpc.private_subnet_ids
  alb_target_group_arn = module.alb.target_group_arn
  iam_instance_profile = module.iam.instance_profile
  ecr_repo_url        = module.ecr.repo_url
  aws_region          = var.aws_region
  ec2_key_name       = var.ec2_key_name
  bastion_sg_id      = module.bastion.security_group_id
}
module "bastion" {
  source             = "./modules/bastion"
  vpc_id             = module.vpc.vpc_id
  public_subnet_id   = module.vpc.public_subnet_ids[0]
  key_name           = var.ec2_key_name
  allowed_ssh_cidr   = var.allowed_ssh_cidr # e.g., your IP like "203.0.113.0/32"
}

