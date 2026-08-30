resource_group_name = "rg-appservice-dev"
location            = "IndiaSouthCentral"

vnet_name          = "vnet-appservice-dev"
vnet_address_space = ["10.10.0.0/16"]

app_service_subnet_name             = "snet-appservice"
app_service_subnet_address_prefixes = ["10.10.1.0/24"]

private_endpoint_subnet_name             = "snet-private-endpoints"
private_endpoint_subnet_address_prefixes = ["10.10.2.0/24"]

app_service_plan_name = "asp-appservice-dev"
app_service_name      = "appservice-dev-pgsn"
app_service_sku       = "B1"

key_vault_name        = "kv-appservice-dev"
private_endpoint_name = "pe-keyvault-dev"
private_dns_zone_name = "privatelink.vaultcore.azure.net"

sql_server_name       = "sql-appservice-dev-pgsn"
sql_database_name     = "sqldb-appservice-dev"
sql_database_sku_name = "Basic"

sql_admin_login_name = "sqladmin"

sql_admin_object_id = "6ffb023d-82d9-495e-a91b-8488f8dc84ea"
sql_admin_tenant_id = "ea6fe6cf-a231-4499-a5ce-6f040462a418"

application_insights_name    = "appi-appservice-dev"
log_analytics_workspace_name = "law-appservice-dev"