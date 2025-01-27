resource "aws_eip" "vpc_eip" {
  domain = "vpc"

  tags = {
    Name = format("%s-vpc-eip", var.project_name)
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.vpc_eip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = format("%s-nat", var.project_name)
  }
}
