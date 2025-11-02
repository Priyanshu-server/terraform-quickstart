variable "main_config" {
  type = object({
    region = string
    tags   = map(string)
  })
}

# Networking
variable "basic_sg_config" {
  type = object({
    sg_name        = string
    sg_description = string
    ingress = object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    })
    egress = object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    })
  })
}

variable "basic_internet_config" {
  type = object({
    igw_name = string,
    router = object({
      rt_name             = string,
      internet_route_cidr = string
    })
  })
}

# Lambda

variable "lambda_config" {
  type = object({
    lambda_runtime = string
  })
}

variable "s3_config" {
  type = object({
    lambda_bucket = string
    glue_bucket   = string
  })
}

variable "glue_config" {
  type = object({
    glue_python_runtime = string
    glue_temp_dir       = string
    log_vars = object({
      log_group_path : string
      log_error_group_path : string
      log_retention_days = number
    })
    generic_vars = object({
      timeout             = number
      max_retries         = number
      max_concurrent_runs = number
    })
  })
}
