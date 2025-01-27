resource "aws_ssm_parameter" "vpc" {
  name = format("/%s/vpc/vpc_id", var.project_name)
  type = "String"
  value = aws_vpc.main.id
}

resource "aws_ssm_parameter" "private" {
  name = format("/%s/vpc/subnet_private", var.project_name)
  type = "String"
  value = aws_subnet.private_subnet.id
}

resource "aws_ssm_parameter" "public" {
  name = format("/%s/vpc/subnet_public", var.project_name)
  type = "String"
  value = aws_subnet.public_subnet.id
}
