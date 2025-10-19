variable "main_config" {
  type = object({
    region = string
    tags   = map(string)
  })
}

variable "lambda_config" {
  type = object({
    lambda_runtime = string
  })
}