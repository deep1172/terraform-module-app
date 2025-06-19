resource "aws_ecr_repository" "app_repo" {
  name                 = var.name
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  encryption_configuration {
    encryption_type = "AES256"
  }
  force_delete = true
  
  tags = {
    Name = var.name
  }
}

resource "aws_ecr_repository" "backend" {
  name = "${var.name_prefix}-backend"
}

resource "aws_ecr_repository" "frontend" {
  name = "${var.name_prefix}-frontend"
}

