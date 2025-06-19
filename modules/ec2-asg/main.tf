#terraform\modules\ec2-asg\main.tf
resource "aws_launch_template" "app" {
  name_prefix   = "app-launch-template-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = var.ec2_key_name
  
  user_data = base64encode(templatefile("${path.module}/user_data.sh", {
  aws_region         = var.aws_region,
  ecr_registry   = var.ecr_registry,
  backend_repo   = "blog-backend",
  frontend_repo  = "blog-frontend"
}))

  iam_instance_profile {
    name = var.iam_instance_profile
  }

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.ec2_sg.id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "app-instance"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "app" {
  name                      = "app-asg"
  vpc_zone_identifier       = var.private_subnets
  desired_capacity          = 2
  min_size                  = 1
  max_size                  = 3
  health_check_type         = "EC2"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }

  target_group_arns = [var.alb_target_group_arn]

  tag {
    key                 = "Name"
    value               = "app-instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
variable "app_ports" {
  default = [3000, 80,22]
}
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Allow app port and SSH from bastion only"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = toset(var.app_ports)
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "tcp"
      security_groups = ingress.key == 22 ? [var.bastion_sg_id] : null
    cidr_blocks     = ingress.key == 22 ? null : ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-app-sg"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}
