terraform {
  required_version = "~> 1.3.6"
  backend "s3" {
    bucket  = "example-prod-tfstate-bucket"
    region  = "ap-northeast-1"
    key     = "prod.tfstate"
    profile = "terraform-user"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.49.0"
    }
  }
}