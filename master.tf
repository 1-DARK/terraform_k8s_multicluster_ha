resource "aws_instance" "master" {
  count = 2

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id                   = aws_subnet.public[0].id
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.master.id
  ]

  key_name = var.key_name

  tags = {
    Name = "k8s-master-${count.index + 1}"
    Role = "master"
  }
}

