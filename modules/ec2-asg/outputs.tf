# modules/ec2-asg/outputs.tf
output "asg_name" {
  value = aws_autoscaling_group.app.name
}
