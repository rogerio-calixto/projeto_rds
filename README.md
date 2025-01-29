# ProjetoEstudoRDS
Projeto de estudo de RDS

# TF Comands
terraform destroy -auto-approve

# Remover Secrets
aws secretsmanager delete-secret --force-delete-without-recovery --secret-id  rds-proxy-dev --region us-east-1 --profile rds-user