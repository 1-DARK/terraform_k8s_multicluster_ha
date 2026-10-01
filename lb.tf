resource "aws_instance" "load_balancer" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = aws_subnet.public[0].id

  vpc_security_group_ids = [
    aws_security_group.load_balancer.id
  ]

  key_name = var.key_name

  associate_public_ip_address = true

  tags = {
    Name = "k8s-load-balancer"
    Role = "load-balancer"
  }
}
