provider "aws" {
  region     = "${var.region}" 
  #access_key = 
  #secret_key = 
}

module "vpc" {
  source = "./vpc"
}

module "sg" {
  source      = "./sg"
  vpc_id      = module.vpc.vpc_id
  environment = module.vpc.environment
}

module "ssh_key" {
  source = "./ssh-key"
}

module "ec2" {
  source      = "./ec2"
  environment = module.vpc.environment
  subnet_id   = module.vpc.public_subnet_ids
  sg_id       = module.sg.sg_id
  key_name    = module.ssh_key.key_name
}