module "artem-vpc" {
  source   = "../VPC"
  vpc_cidr = "20.0.0.0/16"
  pub_cidr = "20.0.4.0/24"
  prv_cidr = "20.0.3.0/24"
  tag      = "app"
}

