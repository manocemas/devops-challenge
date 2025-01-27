resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = format("%sa", var.region)

  tags = {
    Name = format("%s-public-subnet", var.project_name)
  }
}

resource "aws_route_table" "public_internet_access" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = format("%s-public", var.project_name)
  }
}

resource "aws_route" "public_access" {
  route_table_id = aws_route_table.public_internet_access.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_internet_access.id
}
