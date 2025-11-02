resource "aws_vpc" "main" {
  cidr_block           = "10.42.0.0/16"   # change per VPC
  enable_dns_support   = true             # constant → keep literal
  enable_dns_hostnames = true             # constant → keep literal

  tags = merge(
    var.main_config.tags,
    {
      Name = "hello_world_vpc-10-42-0-0-16"
    })
}
