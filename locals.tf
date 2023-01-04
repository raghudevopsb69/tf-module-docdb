locals {
  vpc_id           = lookup(lookup(var.vpc, var.env, null), "vpc_id", null)
  app_subnets_cidr = lookup(lookup(var.vpc, var.env, null), "app_subnets_cidr", null)
}

