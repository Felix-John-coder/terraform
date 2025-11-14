module "vpc" {
  source      = "../../modules/vpc"
  subnet_id   = ["10.0.1.0/24", "10.0.2.0/24"]
  vpc_id      = "10.0.0.0/16"
  environment = "dev"
}

module "ec2" {
  source        = "../../modules/ec2"
  ami           = "ami-0c7d68785ec07306c"
  instance_type = "t3.micro"
  key_name      = "actionkey"
  environment   = "dev"
  ec2_subnet_id = module.vpc.subnet_id
  vpc_net       = module.vpc.vpc-id
  ec2_profile   = module.IAM.theec2_profile
}
module "IAM" {
  source      = "../../modules/IAM"
  role_name   = "ec2_role"
  policy_name = "ec2_to_s3_policy"
  environment = "dev"
  assume_role = jsonencode(local.role_assume)
  policy_json = jsonencode(local.ec2_policy)
  description = "This is an role that give getobject access to an s3 bucket"

}
module "s3" {
  source      = "../../modules/S3"
  bucket_name = "aws-bucket-keep-123"
  environment = "dev"
}