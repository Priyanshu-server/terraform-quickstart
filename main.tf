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


module "s3" {
  source      = "./s3"
  main_config = var.main_config
  s3_config   = var.s3_config
}

module "networking" {
  source      = "./networking"
  main_config = var.main_config
  basic_sg_config = var.basic_sg_config
  basic_internet_config = var.basic_internet_config
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
  basic_networking_config = {
    subnet_ids         = [module.networking.subnet_id],
    sg_ids            = [module.networking.security_group_id],
  }
  depends_on = [module.iam, module.s3]
}

module "glue" {
  source      = "./glue"
  main_config = var.main_config
  glue_config = merge(
    {
      glue_role_arn  = module.iam.glue_role_arn,
      glue_s3_bucket = module.s3.glue_bucket_name,
    },
    var.glue_config
  )
  depends_on = [module.iam, module.s3]
}