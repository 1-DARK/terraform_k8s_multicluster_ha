resource "aws_instance" "worker" {
  count = 1

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id                   = aws_subnet.private[count.index].id
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.worker.id
  ]

  key_name = var.key_name

  tags = {
    Name = "k8s-worker-${count.index + 1}"
    Role = "worker"
  }
}
