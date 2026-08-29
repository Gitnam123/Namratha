resource "azurerm_public_ip" "this" {
  count = var.vm_count

  name                = "${var.vm_name_prefix}-pip-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"
}

resource "azurerm_network_interface" "this" {
  count = var.vm_count

  name                = "${var.vm_name_prefix}-nic-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.this[count.index].id
  }
}

resource "azurerm_linux_virtual_machine" "this" {
  count = var.vm_count

  name                = "${var.vm_name_prefix}-${count.index + 1}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size

  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.this[count.index].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
}
resource "azurerm_network_interface_security_group_association" "this" {
  count = var.vm_count

  network_interface_id      = azurerm_network_interface.this[count.index].id
  network_security_group_id = var.network_security_group_id
}