terraform {
  backend "s3" {
    profile = "rds-user"
    bucket  = "projetos-rds-bucket"
    region  = "us-east-1"
    encrypt = true
  }
}