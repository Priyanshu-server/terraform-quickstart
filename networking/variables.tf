variable "main_config" {
  type = object({
    region = string
    tags   = map(string)
  })
}

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