# #Criando RDS Replica

# resource "aws_db_instance" "rds_db_replica" {
#   skip_final_snapshot     = true
#   replicate_source_db     = aws_db_instance.rds_db.identifier
#   parameter_group_name    = aws_db_parameter_group.rds_db_parameter_group.name
#   instance_class          = "db.t3.small"
#   identifier              = "${var.identifier}-replica"
#   backup_retention_period = 7
#   apply_immediately       = true

#   vpc_security_group_ids = [aws_security_group.sg-rds.id]

#   tags = {
#     Project     = local.projeto
#     Environment = var.ambiente
#     Replica     = "Yes"
#   }

#   lifecycle {
#     ignore_changes = [tags, deletion_protection]
#   }
# }