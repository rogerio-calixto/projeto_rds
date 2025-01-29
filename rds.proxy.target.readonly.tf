##### Exemplo Kenerry

# resource "aws_db_proxy_target" "rds-proxy-target-readonly" {
#   db_instance_identifier = aws_db_instance.rds_db_replica.identifier
#   db_proxy_name          = aws_db_proxy.rds-proxy.name
#   target_group_name      = aws_db_proxy_default_target_group.rds-proxy-target-group.name
# }

## Error: registering RDS DB Proxy Target (rds-proxy/default): 
## operation error RDS: RegisterDBProxyTargets, https response error StatusCode: 400, 
## RequestID: 526ea23f-cf19-4f8f-aa16-89a64bf2b148, DBProxyTargetAlreadyRegisteredFault: 
## The target group prx-tg-000775689b029a4cf already has other registered targets.
## Registering multiple targets is not supported at this time.



##### Criando um readonly-target-group e apontando target para aws_db_instance.rds_db_replica

# resource "aws_db_proxy_default_target_group" "rds-proxy-readonly-target-group" {
#   db_proxy_name = aws_db_proxy.rds-proxy.name

#   connection_pool_config {
#     connection_borrow_timeout    = 120
#     max_connections_percent      = 100
#     max_idle_connections_percent = 50
#   }
# }

# resource "aws_db_proxy_target" "rds-proxy-readonly-target" {
#   db_instance_identifier = aws_db_instance.rds_db_replica.identifier
#   db_proxy_name          = aws_db_proxy.rds-proxy-readonly.name
#   target_group_name      = aws_db_proxy_default_target_group.rds-proxy-readonly-target-group.name
# }

## Error: registering RDS DB Proxy Target (rds-proxy-readonly/default):
## operation error RDS: RegisterDBProxyTargets, https response error StatusCode: 400,
## RequestID: 959b39ab-31e6-4520-ad87-c8571d5ba18b, api error InvalidParameterValue: DB Instance rds-replica
## is in an unsupported state - Instance should not be a read replica.



##### Criando um readonly-target-group e apontando target para aws_db_instance.rds_db.identifier

# resource "aws_db_proxy_target" "rds-proxy-readonly-target" {
#   db_instance_identifier = aws_db_instance.rds_db.identifier
#   db_proxy_name          = aws_db_proxy.rds-proxy-readonly.name
#   target_group_name      = aws_db_proxy_default_target_group.rds-proxy-readonly-target-group.name
# }

# resource "aws_db_proxy_target" "rds-proxy-readonly-target" {
#   db_instance_identifier = aws_db_instance.rds_db_replica.identifier
#   db_proxy_name          = aws_db_proxy.rds-proxy-readonly.name
#   target_group_name      = aws_db_proxy_default_target_group.rds-proxy-readonly-target-group.name
# }

## ERROR: Target group doesnt have any associated read-only instances.