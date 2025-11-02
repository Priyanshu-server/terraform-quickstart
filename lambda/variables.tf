variable "main_config" {
  type = object({
    region = string
    tags   = map(string)
  })
}

## Lambda Vars
variable "lambda_config" {
  type = object({
    lambda_runtime   = string
    lambda_role_arn  = string
    lambda_s3_bucket = string
  })
}

variable "basic_networking_config" {
  type = object({
    subnet_ids = list(string),
    sg_ids     = list(string)
  })
}