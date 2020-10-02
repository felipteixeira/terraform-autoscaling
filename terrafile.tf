module "vpc" {
  source = "./modulos/vpc"
  vpc    = 1
}

module "igw" {
  source = "./modulos/igw"
  igw    = module.vpc.vpc_id
}

module "subnet" {
  source    = "./modulos/subnet"
  private_a = 1
  private_b = 1
  public_a  = 1
  public_b  = 1
  vpc_id    = module.vpc.vpc_id
}

module "route" {
  source           = "./modulos/route"
  rpublic          = 1
  rprivate         = 1
  vpc_id           = module.vpc.vpc_id
  gateway_id       = module.igw.gateway_id
  subnet_public_a  = module.subnet.subnet_id_public_a
  subnet_public_b  = module.subnet.subnet_id_public_b
  subnet_private_a = module.subnet.subnet_id_private_a
  subnet_private_b = module.subnet.subnet_id_private_b

}

module "secgroups" {
  source = "./modulos/security_groups"
  vpc_id = module.vpc.vpc_id
  web    = 1
  db     = 1

}

module "alb" {
  source          = "./modulos/alb"
  vpc_id          = module.vpc.vpc_id
  subnet_public_a = module.subnet.subnet_id_public_a
  subnet_public_b = module.subnet.subnet_id_public_b
  lb-sg           = 1
  lb              = 1
  tg              = 1
  lbl             = 1

}

module "ec2" {
  source      = "./modulos/ec2"
  autoscaling = 1
  this        = 2
  scaleup     = 1
  scaledown   = 1
  jenkins     = 1

  subnet_public_a  = module.subnet.subnet_id_public_a
  subnet_public_b  = module.subnet.subnet_id_public_b
  subnet_private_a = module.subnet.subnet_id_private_a


  vpc_id = module.vpc.vpc_id
  lb_id  = module.alb.lb_sg
  db_id  = module.secgroups.db_id
  tg_arn = module.alb.tg_arn

}

module "rds" {
  source = "./modulos/rds"
  rds    = 1
  web    = 1

  db_id            = module.secgroups.db_id
  subnet_private_a = module.subnet.subnet_id_private_a
  subnet_private_b = module.subnet.subnet_id_private_b

}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "gateway_id" {
  value = module.igw.gateway_id
}
