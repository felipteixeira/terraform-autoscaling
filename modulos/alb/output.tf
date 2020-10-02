output "lb_sg" {
    value = aws_security_group.lb-sg.id
}

output "tg_arn" {
    value = aws_lb_target_group.tg.arn
}