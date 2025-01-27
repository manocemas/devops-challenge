resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = format("%sa", var.region)

  tags = {
    Name = format("%s-private-subnet", var.project_name)
  }
}

resource "aws_route_table" "private_internet_access" {
  vpc_id = aws_vpc.main.id
  
  tags = {
    Name = format("%s-private", var.project_name)
  }
}

resource "aws_route" "private_access" {
  route_table_id = aws_route_table.private_internet_access.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "private" {
  subnet_id = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_internet_access.id
}
