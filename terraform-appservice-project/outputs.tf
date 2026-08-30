output "resource_group_name" {
  value = module.networking.resource_group_name
}

output "vnet_id" {
  value = module.networking.vnet_id
}

output "app_service_subnet_id" {
  value = module.networking.app_service_subnet_id
}

output "private_endpoint_subnet_id" {
  value = module.networking.private_endpoint_subnet_id
}

output "app_service_name" {
  value = module.app_service.app_service_name
}

output "app_service_hostname" {
  value = module.app_service.app_service_default_hostname
}

output "app_service_principal_id" {
  value = module.app_service.principal_id
}
output "key_vault_name" {
  value = module.key_vault.key_vault_name
}

output "key_vault_uri" {
  value = module.key_vault.key_vault_uri
}
output "key_vault_private_endpoint_ip" {
  value = module.private_endpoint.private_endpoint_ip
}

output "key_vault_private_endpoint_id" {
  value = module.private_endpoint.private_endpoint_id
}

output "sql_server_name" {
  value = module.sql.sql_server_name
}

output "sql_database_name" {
  value = module.sql.sql_database_name
}

output "sql_server_fqdn" {
  value = module.sql.sql_server_fully_qualified_domain_name
}
output "application_insights_name" {
  value = module.application_insights.application_insights_name
}

output "application_insights_id" {
  value = module.application_insights.application_insights_id
}