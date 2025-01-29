resource "aws_db_proxy_default_target_group" "rds-proxy-target-group" {
  db_proxy_name = aws_db_proxy.rds-proxy.name

  connection_pool_config {
    connection_borrow_timeout    = 120
    max_connections_percent      = 100
    max_idle_connections_percent = 50
  }
}

resource "aws_db_proxy_target" "rds-proxy-target" {
  db_instance_identifier = aws_db_instance.rds_db.identifier
  db_proxy_name          = aws_db_proxy.rds-proxy.name
  target_group_name      = aws_db_proxy_default_target_group.rds-proxy-target-group.name
}