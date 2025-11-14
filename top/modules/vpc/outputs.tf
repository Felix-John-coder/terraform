output "vpc-id" {
  value = aws_vpc.vpc-id.id
}
output "subnet_id" {
  value = aws_subnet.dynamic_subnet[0].id
}