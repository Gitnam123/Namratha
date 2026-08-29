module "resource_group" {
  source = "../../modules/resource-group"

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}


module "vnet" {
  source = "../../modules/networking/vnet"

  name                = var.vnet_name
  location            = var.location
  resource_group_name = module.resource_group.name

  address_space = var.vnet_address_space

  tags = var.tags
}


module "subnet" {
  for_each = var.subnets

  source = "../../modules/networking/subnet"

  name                 = each.value.name
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.vnet.name

  address_prefixes = [
    each.value.address_prefix
  ]
}


module "nsg" {
  source = "../../modules/networking/nsg"

  name                = var.nsg_name
  location            = var.location
  resource_group_name = module.resource_group.name

  security_rules = var.security_rules

  tags = var.tags
}


# ============================================================
# VM COUNT MODULE
# ============================================================

module "vm_count" {
  source = "../../modules/compute/vm-count"

  resource_group_name = module.resource_group.name
  location            = var.location

  subnet_id = module.subnet["devops"].id

  vm_count       = var.vm_count
  vm_name_prefix = "${var.vm_name}-count"

  vm_size = var.vm_size

  admin_username = var.admin_username
  admin_password = var.admin_password

  image_publisher = "Canonical"
  image_offer     = "ubuntu-24_04-lts"
  image_sku       = "server"
  image_version   = "latest"

  network_security_group_id = module.nsg.id
}


# ============================================================
# VM FOR_EACH MODULE
# ============================================================

module "vm_foreach" {
  source = "../../modules/compute/vm-foreach"

  resource_group_name = module.resource_group.name
  location            = var.location

  subnet_id = module.subnet["devops"].id

  vm_config = var.vm_foreach

  vm_name_prefix = "${var.vm_name}-foreach"

  admin_username = var.admin_username
  admin_password = var.admin_password

  image_publisher = "Canonical"
  image_offer     = "ubuntu-24_04-lts"
  image_sku       = "server"
  image_version   = "latest"

  network_security_group_id = module.nsg.id
}


# ============================================================
# NGINX
# Install only on COUNT VM 1
# ============================================================

module "nginx" {
  source = "../../modules/compute/scripts"

  vm_id = module.vm_count.vm_ids[0]
}