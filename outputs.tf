output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "subnet_publica_ids" {
  value = module.vpc.subnet_publica_ids
}


output "subnet_privada_ids" {
  value = module.vpc.subnet_privada_ids
}

output "avaiable_zones" {
  value = module.vpc.avaiable_zones
}


output "rds_entpoint" {
  value = aws_db_instance.rds_db.endpoint
}