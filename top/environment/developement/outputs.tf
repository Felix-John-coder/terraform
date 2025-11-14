output "ec2_ip" {
  value = module.ec2.ec2_ip
}
output "private_ip" {
  value = module.ec2.private
}

output "vpc_id" {
  value = module.vpc.vpc-id

}
output "subnet-id" {
  value = module.vpc.subnet_id
}

output "s3_arn" {
  value = module.s3.bucket_arn
}