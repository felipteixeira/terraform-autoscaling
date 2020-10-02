variable "autoscaling" {}
variable "this" {}
variable "scaleup" {}
variable "scaledown" {}
variable "jenkins" {}


variable "vpc_id" {}
variable "lb_id" {}
variable "db_id" {}
variable "subnet_public_a" {}
variable "subnet_public_b" {}
variable "subnet_private_a" {}
variable "tg_arn" {}

variable "ami" {
  type    = string
  default = "ami-0817d428a6fb68645"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "region" {
  type    = string
  default = "us-east-1a"
}

variable "key_pair" {
  type    = string
  default = "aws"
}




variable "enabled_metrics" {
  description = "A list of metrics to collect. The allowed values are GroupMinSize, GroupMaxSize, GroupDesiredCapacity, GroupInServiceInstances, GroupPendingInstances, GroupStandbyInstances, GroupTerminatingInstances, GroupTotalInstances"
  type        = list(string)

  default = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]
}
