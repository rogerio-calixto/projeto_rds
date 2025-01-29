#Criando RDS

resource "aws_db_parameter_group" "rds_db_parameter_group" {
  name   = "rds-parameter-group-v15-7"
  family = "postgres15"

  parameter {
    name         = "rds.force_ssl"
    value        = "0"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "max_prepared_transactions"
    value        = "64"
    apply_method = "pending-reboot"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_db_instance" "rds_db" {
  copy_tags_to_snapshot           = true
  allocated_storage               = 20
  storage_type                    = "gp2"
  engine                          = "postgres"
  allow_major_version_upgrade     = true
  engine_version                  = "15.7"
  instance_class                  = "db.t3.small"
  db_name                         = var.databasename
  username                        = var.username
  password                        = var.password
  vpc_security_group_ids          = [aws_security_group.sg-rds.id]
  db_subnet_group_name            = aws_db_subnet_group.subnetGroups.name
  availability_zone               = var.avaiable_zones[0]
  skip_final_snapshot             = true
  identifier                      = var.identifier
  parameter_group_name            = aws_db_parameter_group.rds_db_parameter_group.name
  apply_immediately               = true
  monitoring_interval             = 60
  monitoring_role_arn             = aws_iam_role.rds-monitoring-role.arn
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  performance_insights_enabled    = false
  backup_retention_period         = 1

  tags = {
    Projeto   = local.projeto
    Ambiente  = var.ambiente
    AutoStart = "Yes"
    AutoStop  = "Yes"
  }

  lifecycle {
    ignore_changes = [tags, deletion_protection]
  }
}

resource "aws_db_subnet_group" "subnetGroups" {
  name       = "subnetgroups"
  subnet_ids = module.vpc.subnet_publica_ids


  tags = {
    Name     = "Subnet Groups"
    Projeto  = local.projeto
    Ambiente = var.ambiente
  }
}