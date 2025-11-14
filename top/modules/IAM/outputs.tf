output "role_arn" {
  value = aws_iam_role.this.arn
}
output "policy_arn" {
  value = aws_iam_policy.this_policy.arn
}
output "theec2_profile" {
  value = aws_iam_instance_profile.ec2_profile.name
}