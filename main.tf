provider "aws" {
  profile = local.profile
  region  = var.regiao

  default_tags {
    tags = {
      Ambiente     = var.ambiente
      Projeto      = local.projeto
      Tipo_Criacao = local.tipo_criacao
    }
  }
}