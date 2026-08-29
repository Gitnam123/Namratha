# ============================================================
# PUBLIC IP
# ============================================================

resource "azurerm_public_ip" "this" {
  for_each = var.vm_config

  name                = "${var.vm_name_prefix}-pip-${each.key}"
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"
}


# ============================================================
# NETWORK INTERFACE
# ============================================================

resource "azurerm_network_interface" "this" {
  for_each = var.vm_config

  name                = "${var.vm_name_prefix}-nic-${each.key}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.this[each.key].id
  }
}


# ============================================================
# NSG ASSOCIATION
# ============================================================

resource "azurerm_network_interface_security_group_association" "this" {
  for_each = var.vm_config

  network_interface_id      = azurerm_network_interface.this[each.key].id
  network_security_group_id = var.network_security_group_id
}


# ============================================================
# LINUX VIRTUAL MACHINE
# ============================================================

resource "azurerm_linux_virtual_machine" "this" {
  for_each = var.vm_config

  name                = "${var.vm_name_prefix}-${each.key}"
  resource_group_name = var.resource_group_name
  location            = var.location

  size = each.value.size

  admin_username = var.admin_username
  admin_password = var.admin_password

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.this[each.key].id
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