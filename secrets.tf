# Creating a AWS secret for microservice settings
resource "aws_secretsmanager_secret" "secret-rds" {
  name        = "${local.projeto}-proxy-${var.ambiente}"
  description = "Autenticacao RDS"
  tags = {
    Name        = "${local.projeto}-proxy-${var.ambiente}"
    Project     = local.projeto
    Environment = var.ambiente
  }
}

# Creating a AWS secret versions for settings
resource "aws_secretsmanager_secret_version" "sversion" {
  secret_id     = aws_secretsmanager_secret.secret-rds.id
  secret_string = <<EOF
   {
    "username" : "",
    "password" : "",
    "engine" : "",
    "host" : "",
    "ALLOW_SWAGGER_ACCESS" : "NO",
    "port" : "",
    "dbname" : "",
    "dbInstanceIdentifier" : "}"
   }
   EOF

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [secret_string]
  }
}