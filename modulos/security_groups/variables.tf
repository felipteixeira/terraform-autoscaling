variable "web" {}
variable "db" {}
variable "vpc_id" {}

variable "vpc_cidr" {
  type    = string
  default = "10.10.0.0/16"
}