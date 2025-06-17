# modules/ecr/outputs.tf
output "repo_url" {
  value = aws_ecr_repository.app_repo.repository_url
}
output "repo_arn" {
  value = aws_ecr_repository.app_repo.arn
}
