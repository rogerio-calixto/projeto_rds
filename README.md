# Requisitos para rodar essa projeto
Criar um bucket S3 para armazenar o arquivo tfstate do terraform
Criar usuario rds-user, dando as permissoes adequadas para executar o projeto, e acesso para Get, Put e ListBucket no bucket que voce criou
Cria uma credencial para esse usuario e configure na sua maquina o profile rds-user usando o aws configure
Conforme as configurações que efetuou, ajuste no arquivo state.tf os parametros: profile, bucket, key, region
   - Exemplo:

     profile = "rds-user"
     bucket  = "rds-tfstate-bucket"
     key     = "terraform/state/tf-rds.tfstate"
     region  = "us-east-1"

# ProjetoEstudoRDS
Projeto de estudo de RDS

# TF Comands
terraform destroy -auto-approve

# Remover Secrets
aws secretsmanager delete-secret --force-delete-without-recovery --secret-id  rds-proxy-dev --region us-east-1 --profile rds-user