# --- ALB ---
resource "aws_lb" "app_alb" {
  name               = "app-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = []              # Placeholder
  security_groups    = []              # Placeholder
}


# --- IAM Role ---
resource "aws_iam_role" "ec2_role" {
  name = "ec2_app_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}
