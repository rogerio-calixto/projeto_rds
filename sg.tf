resource "aws_security_group" "sg-rds" {
  name        = "${local.projeto}-sg-${var.ambiente}"
  description = "Habilita acesso ao RDS"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "libera acesso ao RDS a todos os recursos vinculados a este Security Group"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

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
    Name     = "${local.projeto}-sg-${var.ambiente}"
    Projeto  = local.projeto
    Ambiente = var.ambiente
  }

  depends_on = [module.vpc]
}