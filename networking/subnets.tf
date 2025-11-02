
resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.42.1.0/24" # change per subnet
  map_public_ip_on_launch = true           # constant → keep literal

  tags = merge(
    var.main_config.tags,
    {
      Name = "hello_world_subnet-10-42-1-0-24"
  })
}
