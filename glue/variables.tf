

variable "main_config" {
  type = object({
    region = string
    tags   = map(string)
  })
}

variable "glue_config" {
  type = object({
    glue_python_runtime = string
    glue_role_arn       = string
    glue_s3_bucket      = string
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
