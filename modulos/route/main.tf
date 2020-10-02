resource "aws_route_table" "rpublic" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.gateway_id
  }

  tags = {
    Name = "Route Table Public"
  }

}

resource "aws_route_table" "rprivate" {
  vpc_id = var.vpc_id

  tags = {
    Name = "Route Table Private"
  }

}

resource "aws_route_table_association" "public_a" {
  subnet_id      = var.subnet_public_a
  route_table_id = aws_route_table.rpublic.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = var.subnet_public_b
  route_table_id = aws_route_table.rpublic.id
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = var.subnet_private_a
  route_table_id = aws_route_table.rprivate.id
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = var.subnet_private_b
  route_table_id = aws_route_table.rprivate.id
}



