data "azurerm_client_config" "current" {}

module "networking" {
  source = "./modules/networking"

  resource_group_name = var.resource_group_name
  location            = var.location

  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space

  app_service_subnet_name             = var.app_service_subnet_name
  app_service_subnet_address_prefixes = var.app_service_subnet_address_prefixes

  private_endpoint_subnet_name             = var.private_endpoint_subnet_name
  private_endpoint_subnet_address_prefixes = var.private_endpoint_subnet_address_prefixes
}
module "application_insights" {
  source = "./modules/application-insights"

  resource_group_name = module.networking.resource_group_name
  location            = var.location

  application_insights_name    = var.application_insights_name
  log_analytics_workspace_name = var.log_analytics_workspace_name
  log_analytics_location       = "Central India"
}
module "app_service" {
  source = "./modules/app-service"

  resource_group_name = module.networking.resource_group_name
  location            = var.location

  app_service_plan_name = var.app_service_plan_name
  app_service_name      = var.app_service_name

  app_service_subnet_id = module.networking.app_service_subnet_id

  sku_name = var.app_service_sku

  application_insights_instrumentation_key = module.application_insights.instrumentation_key

  sql_server   = "${var.sql_server_name}.database.windows.net"
  sql_database = var.sql_database_name
}
module "key_vault" {
  source = "./modules/key-vault"

  resource_group_name = module.networking.resource_group_name
  location            = var.location

  key_vault_name = var.key_vault_name

  tenant_id = data.azurerm_client_config.current.tenant_id

  app_service_principal_id = module.app_service.principal_id
}
module "private_endpoint" {
  source = "./modules/private-endpoint"

  resource_group_name = module.networking.resource_group_name
  location            = var.location

  private_endpoint_name = var.private_endpoint_name

  private_endpoint_subnet_id = module.networking.private_endpoint_subnet_id

  key_vault_id = module.key_vault.key_vault_id

  private_dns_zone_name = var.private_dns_zone_name

  vnet_id = module.networking.vnet_id
}

module "sql" {
  source = "./modules/sql"

  resource_group_name = module.networking.resource_group_name
  location            = var.location

  sql_server_name       = var.sql_server_name
  sql_database_name     = var.sql_database_name
  sql_database_sku_name = var.sql_database_sku_name

  sql_admin_login_name = var.sql_admin_login_name
  sql_admin_object_id  = var.sql_admin_object_id
  sql_admin_tenant_id  = var.sql_admin_tenant_id

  app_service_principal_id = module.app_service.principal_id
}