# resource "aws_iam_role" "rds-proxy-role" {
#   name = "rds_proxy_role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Action = "sts:AssumeRole",
#         Effect = "Allow",
#         Principal = {
#           Service = "rds.amazonaws.com"
#         }
#       },
#     ],
#   })
# }

# resource "aws_iam_policy" "rds-proxy-policy" {
#   name        = "rds_proxy_policy"
#   description = "Permissao de acesso ao Secrets de RDS"
#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect = "Allow",
#         Action = [
#           "secretsmanager:GetSecretValue"
#         ],
#         Resource = "${aws_secretsmanager_secret.secret-rds.arn}"
#       },
#     ],
#   })
#   depends_on = [aws_secretsmanager_secret.secret-rds]
# }

# resource "aws_iam_role_policy_attachment" "rds-proxy-role-policy-attachment" {
#   policy_arn = aws_iam_policy.rds-proxy-policy.arn
#   role       = aws_iam_role.rds-proxy-role.name
# }

# resource "aws_db_proxy" "rds-proxy" {
#   name                   = "rds-proxy"
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