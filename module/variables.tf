variable "general_config" {
  type = map(any)
}
variable "regions" {
  type = map(any)
}
variable "vpc_cidr" {}
variable "availability_zones" {}
variable "public_subnets" {}
variable "dmz_subnets" {}
variable "private_subnets" {}
variable "public_subnet_ids" {}
variable "dmz_subnet_ids" {}
variable "private_subnet_ids" {}
#variable "zone_name" {}
variable "sub_domain_1" {}
variable "image_name" {}
variable "ecr_repository_url" {}
provider "aws" {
  alias  = "us-east-1"
  region = var.regions["virginia"]
}
