
terraform {
  backend "s3" {
    bucket  = "projetos-tfstate-bucket"
    key     = "terraform/state/tf-estudo-rds.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  profile = local.profile
  assume_role {
    role_arn = var.arn_assumerole
  }

  default_tags {
    tags = {
      Ambiente     = var.ambiente
      Projeto      = local.projeto
      Tipo_Criacao = local.tipo_criacao
    }
  }
}