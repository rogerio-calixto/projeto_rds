# resource "aws_db_proxy" "rds-proxy-readonly" {
#   name                   = "rds-proxy-readonly"
#   debug_logging          = false
#   engine_family          = "POSTGRESQL"
#   idle_client_timeout    = 300
#   require_tls            = true
#   role_arn               = aws_iam_role.rds-proxy-role.arn
#   vpc_security_group_ids = [aws_security_group.sg-rds.id]
#   vpc_subnet_ids         = module.vpc.public-subnet_ids

#   auth {
#     auth_scheme = "SECRETS"
#     iam_auth    = "DISABLED"
#     secret_arn  = aws_secretsmanager_secret.secret-rds.arn
#   }

#   depends_on = [aws_secretsmanager_secret.secret-rds]
# }