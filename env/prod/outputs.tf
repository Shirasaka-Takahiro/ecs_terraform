output "vpc_id" {
  value = module.prod.vpc_id
}

output "public_subnet_ids" {
  value = module.prod.public_subnet_ids
}

#output "dmz_subnet_ids" {
#  value = module.prod.dmz_subnet_ids
#}

output "private_subnet_ids" {
  value = module.prod.private_subnet_ids
}

output "instance_ids" {
  value = module.prod.instance_ids
}

output "public_ip_natgateway" {
  value = module.prod.natgateway_ip
}

output "public_ip_bastion" {
  value = module.prod.bastion_ip
}

output "alb_dns_name" {
  value = module.prod.alb_dns_name
}

output "rds_endpoint" {
  value = module.prod.rds_endpoint
}