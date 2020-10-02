resource "aws_subnet" "public_a" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "public 1a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.10.2.0/24"
  availability_zone = "${var.region}b"

  tags = {
    Name = "public 2a"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.10.3.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "private 1a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.10.4.0/24"
  availability_zone = "${var.region}b"

  tags = {
    Name = "private 2b"
  }
}
