resource "azurerm_virtual_machine_extension" "nginx" {
  name                 = "nginx-install"
  virtual_machine_id   = var.vm_id

  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = jsonencode({
    script = file("${path.module}/nginx-install.sh")
  })
}