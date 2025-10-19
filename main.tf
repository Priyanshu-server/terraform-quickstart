terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-east-1"
}

module "iam" {
  source      = "./iam"
  main_config = var.main_config
}

module "lambda" {
  source      = "./lambda"
  main_config = var.main_config
  lambda_config = merge(
    {
      lambda_role_arn = module.iam.lambda_role_arn
    },
    var.lambda_config
  )
}