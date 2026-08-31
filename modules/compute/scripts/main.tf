resource "azurerm_virtual_machine_extension" "nginx" {

  name                 = "nginx-install"
  virtual_machine_id   = var.vm_id

  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = jsonencode({
    fileUris = [
      "https://raw.githubusercontent.com/Gitnam123/Namratha/main/modules/compute/scripts/nginx-install.sh"
    ]

    commandToExecute = "bash nginx-install.sh"
  })
}