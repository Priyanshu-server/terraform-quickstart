variable "main_config" {
  type = object({
    region = string
    tags   = map(string)
  })
}

variable "s3_config" {
    type = object({
      lambda_bucket = string
    })
}