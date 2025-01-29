resource "aws_security_group" "sg-rds" {
  name        = "${local.projeto}-sg-rds-${var.ambiente}"
  description = "Habilita acesso ao RDS"
  vpc_id      = module.vpc.aws_vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${local.projeto}-sg-${var.ambiente}"
    Project     = local.projeto
    Environment = var.ambiente
  }

  depends_on = [module.vpc]
}