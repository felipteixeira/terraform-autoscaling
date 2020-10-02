resource "aws_security_group" "lb-sg" {
  name        = "alb-sg"
  description = "Security Group to ALB"
  vpc_id      = var.vpc_id

  ingress {
    from_port  = 80
    to_port    = 80
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "load Balancer"
  }
}

resource "aws_lb" "lb" {
  name            = "alb"
  security_groups = ["${aws_security_group.lb-sg.id}"]
  subnets         = [var.subnet_public_a, var.subnet_public_b]

  tags = {
    Name = "ALB"
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path              = "/"
    healthy_threshold = 2
  }
}

resource "aws_lb_listener" "lbl" {
  load_balancer_arn = aws_lb.lb.arn
  port = 80
  protocol = "HTTP"

  default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.tg.arn
  }
}










