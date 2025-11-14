terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "terraforn-tfstate-aws-felix123"
    dynamodb_table = "terraform-state-lock-123"
    key            = "development/terraform.tfstate"
    encrypt        = true
    region         = "eu-north-1"
  }
}