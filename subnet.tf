resource "aws_subnet" "public" {
  count = 2

  vpc_id = aws_vpc.k8s_vpc.id

  cidr_block = count.index == 0 ? "10.0.1.0/24" : "10.0.2.0/24"

  availability_zone = var.availability_zones[count.index]

  map_public_ip_on_launch = true

  tags = {
    Name = "k8s-public-subnet-${count.index + 1}"
    Type = "public"
  }
}

resource "aws_subnet" "private" {
  count = 2

  vpc_id = aws_vpc.k8s_vpc.id

  cidr_block = count.index == 0 ? "10.0.3.0/24" : "10.0.4.0/24"

  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "k8s-private-subnet-${count.index + 1}"
    Type = "private"
  }
}
