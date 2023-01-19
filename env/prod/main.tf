provider "aws" {
  profile = "terraform-user"
  region  = var.regions["tokyo"]
}

provider "aws" {
  profile = "terraform-user"
  alias   = "us-east-1"
  region  = var.regions["virginia"]
}

module "prod" {
  source = "../../module"

  general_config          = var.general_config
  regions                 = var.regions
  availability_zones      = var.availability_zones
  vpc_cidr                = var.vpc_cidr
  public_subnets          = var.public_subnets
  dmz_subnets             = var.dmz_subnets
  private_subnets         = var.private_subnets
  public_subnet_ids       = module.prod.public_subnet_ids
  dmz_subnet_ids          = module.prod.dmz_subnet_ids
  private_subnet_ids      = module.prod.private_subnet_ids
  ami                     = var.ami
  instance_type_web       = var.instance_type_web
  volume_type_web         = var.volume_type_web
  volume_size_web         = var.volume_size_web
  key_name_web            = var.key_name_web
  public_key_path_web     = var.public_key_path_web
  instance_ids            = module.prod.instance_ids
  #zone_name          = var.zone_name
  sub_domain_1                      = var.sub_domain_1
  image_name = var.image_name
}