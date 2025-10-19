variable "main_config" {
    type = object ({
        region = string
        tags   = map(string)
    })
}