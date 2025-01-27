output "ssm_private_subnet_private" {
    value = aws_ssm_parameter.private.id
}

output "ssm_private_subnet_public" {
    value = aws_ssm_parameter.public.id
}

output "aws_eip_vpc" {
  value = aws_eip.vpc_eip.public_ip
}

output "aws_eip_ec2" {
  value = aws_eip.ec2_eip.public_ip
}