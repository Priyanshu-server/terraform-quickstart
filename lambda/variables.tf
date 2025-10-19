variable "main_config" {
    type = object ({
        region = string
        tags   = map(string)
    })
}

## Lambda Vars
variable "lambda_config" {
    type = object ({
        lambda_runtime = string
        lambda_role_arn = string
    })
}
