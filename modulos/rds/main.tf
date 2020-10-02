resource "aws_db_subnet_group" "rds" {
  name       = "main"
  subnet_ids = [var.subnet_private_a, var.subnet_private_b]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "web" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  availability_zone    = "${var.region}a"
  skip_final_snapshot  = true

  db_subnet_group_name   = aws_db_subnet_group.rds.id
  vpc_security_group_ids = [var.db_id]
}
