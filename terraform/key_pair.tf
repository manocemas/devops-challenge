resource "aws_key_pair" "teamsoft_ssh_access" {
  key_name   = "teamsoft_ssh"
  public_key = var.key_pair
}