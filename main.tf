resource "aws_instance" "my_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer.key_name

  tags = {
    Name = var.name_tag,
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "terra-key"
  public_key = file("/home/projectvm/Project_Task/terra-key.pub")
}
