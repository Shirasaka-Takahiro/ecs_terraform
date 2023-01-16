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
  instance_type_bastion   = var.instance_type_bastion
  volume_type_bastion     = var.volume_type_bastion
  volume_size_bastion     = var.volume_size_bastion
  key_name_bastion        = var.key_name_bastion
  public_key_path_bastion = var.public_key_path_bastion
  instance_ids            = module.prod.instance_ids
  #zone_name          = var.zone_name
  sub_domain_1                      = var.sub_domain_1
  sub_domain_2                      = var.sub_domain_2
  engine_name                       = var.engine_name
  major_engine_version              = var.major_engine_version
  engine                            = var.engine
  engine_version                    = var.engine_version
  username                          = var.username
  password                          = var.password
  instance_class                    = var.instance_class
  storage_type                      = var.storage_type
  allocated_storage                 = var.allocated_storage
  multi_az                          = var.multi_az
  sns_email                         = var.sns_email
  cwa_actions                       = var.cwa_actions
  cwa_threshold_rds_freeablememory  = var.cwa_threshold_rds_freeablememory
  cwa_threshold_rds_freeablestorage = var.cwa_threshold_rds_freeablestorage
}