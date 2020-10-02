resource "aws_internet_gateway" "igw" {
  vpc_id = var.igw

  tags = {
    Name = "Gunama Internet Gateway"
  }
}
