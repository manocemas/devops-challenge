resource "aws_eip" "ec2_eip" {
  domain = "vpc"

  tags = {
    Name = format("%s-ec2-eip", var.project_name)
  }
}

resource "aws_eip_association" "eip_association" {
  instance_id   = aws_instance.teamsoft_web_server.id
  allocation_id = aws_eip.ec2_eip.id
}

resource "aws_instance" "teamsoft_web_server" {
  ami           = var.vm_ami
  instance_type = var.vm_type
  subnet_id     = aws_subnet.public_subnet.id

  vpc_security_group_ids = [aws_security_group.teamsoft_web_server.id]
  key_name               = aws_key_pair.teamsoft_ssh_access.key_name
  

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
    encrypted   = true
  }

  tags = {
    Name = format("%s-ec2", var.project_name)
  }

#   user_data = <<-EOF
#               #!/bin/bash
#               apt-get update
#               apt-get upgrade -y
#               apt-get install -y nginx
#               systemctl enable nginx
#               systemctl start nginx
#               EOF
}