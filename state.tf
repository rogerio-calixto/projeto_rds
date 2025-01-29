terraform {
  backend "s3" {
    profile = "rds-user"
    bucket  = "projetos-tfstate-bucket"
    key     = "terraform/state/tf-estudo-rds.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}