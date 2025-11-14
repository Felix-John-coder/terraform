locals {

  ec2_policy = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:GetObject"]
        Resource = "${module.s3.bucket_arn}/*"     # object-level
      },
      {
        Effect   = "Allow"
        Action   = ["s3:ListBucket"]
        Resource =  "${module.s3.bucket_arn}"            # bucket-level
      }
    ]
  }
  role_assume={
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  }
}

