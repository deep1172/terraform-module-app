#!/bin/bash
exec > /var/log/user-data.log 2>&1
set -ex

# Install Docker and AWS CLI
apt-get update -y
apt-get install -y docker.io awscli

# Add ubuntu user to docker group
usermod -aG docker ubuntu

# Start and enable Docker
systemctl start docker
systemctl enable docker

# Run Docker commands as ubuntu user
runuser -l ubuntu -c "aws ecr get-login-password --region ${aws_region} | docker login --username AWS --password-stdin ${ecr_registry}"
runuser -l ubuntu -c "docker pull ${ecr_registry}/${backend_repo}:latest"
runuser -l ubuntu -c "docker pull ${ecr_registry}/${frontend_repo}:latest"
runuser -l ubuntu -c "docker run -d --name blog-backend -p 3000:3000 ${ecr_registry}/${backend_repo}:latest"
runuser -l ubuntu -c "docker run -d --name blog-frontend -p 80:80 ${ecr_registry}/${frontend_repo}:latest"
