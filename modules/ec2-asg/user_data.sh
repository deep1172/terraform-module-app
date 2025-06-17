#!/bin/bash
apt-get update -y
apt-get install -y docker.io awscli
systemctl start docker
systemctl enable docker
aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin ${ecr_repo_url}
docker pull ${ecr_repo_url}:latest
docker run -d -p 3000:3000 ${ecr_repo_url}:latest