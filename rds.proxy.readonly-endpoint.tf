# resource "aws_db_proxy_endpoint" "rds-proxy-readonly-endpoint" {
#   db_proxy_name          = aws_db_proxy.rds-proxy.name
#   db_proxy_endpoint_name = "rds-proxy-readonly"
#   vpc_subnet_ids         = module.vpc.subnet_publica_ids
#   vpc_security_group_ids = [aws_security_group.sg-rds.id]
#   target_role            = "READ_ONLY"

#   depends_on = [module.vpc, aws_security_group.sg-rds]
# }
