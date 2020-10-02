variable "rds" {}
variable "web" {}
variable "db_id" {}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "subnet_private_a" {}
variable "subnet_private_b" {}
