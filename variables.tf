variable "ambiente" {
  type        = string
  description = "ambiente para o recurso"
  default     = "dev"
}

variable "regiao" {
  type        = string
  description = "regiao onde sera criado o recurso"
  default     = "us-east-1"
}

variable "regiao_names" {
  description = "regioes disponíveis"
  default = {
    us-east-1 = "virginia"
    us-east-2 = "ohio"
    us-west-1 = "california"
    us-west-2 = "oregon"
  }
}

variable "databasename" {
  type        = string
  description = "DB name"
  default = "estudo_rds_db"
}

variable "username" {
  type        = string
  description = "DB username"
  default = "admin"
}

variable "password" {
  type        = string
  description = "DB password"
  default = "senha123456"
}

variable "identifier" { default = "estudo_rds" }

variable "avaiable_zones" {
  type        = list(string)
  description = "Avaiable zones"
}

variable "arn_assumerole" {
  type = string
}