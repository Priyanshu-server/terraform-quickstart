
resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main.id
  tags   = merge(
            var.main_config.tags,
            { Name = var.basic_internet_config.igw_name }
            )
}

resource "aws_route_table" "main_rt" {
  vpc_id = aws_vpc.main.id
  tags   = merge(
            var.main_config.tags,
            { Name =  var.basic_internet_config.router.rt_name }
            )
}

# Default internet route is usually constant → keep in var for global control
resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.main_rt.id
  destination_cidr_block = var.basic_internet_config.router.internet_route_cidr
  gateway_id             = aws_internet_gateway.main_igw.id
}

resource "aws_route_table_association" "subnet_assoc" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main_rt.id
}
