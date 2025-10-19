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
  region  = var.main_config.region
  profile = "lab"
}

module "iam" {
  source      = "./iam"
  main_config = var.main_config
  s3_config   = var.s3_config
}

module "lambda" {
  source      = "./lambda"
  main_config = var.main_config
  lambda_config = merge(
    {
      lambda_role_arn  = module.iam.lambda_role_arn,
      lambda_s3_bucket = module.s3.lambda_bucket_name,
    },
    var.lambda_config
  )
  depends_on = [module.s3]
}

module "s3" {
  source      = "./s3"
  main_config = var.main_config
  s3_config   = var.s3_config
}