resource "azurerm_service_plan" "this" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location

  os_type  = "Linux"
  sku_name = var.sku_name
}

resource "azurerm_linux_web_app" "this" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name

  service_plan_id = azurerm_service_plan.this.id

  https_only = true

  identity {
    type = "SystemAssigned"
  }

  virtual_network_subnet_id = var.app_service_subnet_id

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY = "@Microsoft.KeyVault(SecretUri=${var.application_insights_instrumentation_key_secret_uri})"
    SQL_SERVER                     = var.sql_server
    SQL_DATABASE                   = var.sql_database
  }

  site_config {
  always_on              = true
  vnet_route_all_enabled = true

  application_stack {
    node_version = "20-lts"
  }
}
}