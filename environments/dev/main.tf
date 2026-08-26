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

module "public_ip" {
  source = "../../modules/networking/public-ip"

  name                = var.public_ip_name
  location            = var.location
  resource_group_name = module.resource_group.name

  tags = var.tags
}

module "nic" {
  source = "../../modules/compute/nic"

  name                = var.nic_name
  location            = var.location
  resource_group_name = module.resource_group.name

  subnet_id = module.subnet["devops"].id

  public_ip_id              = module.public_ip.id
  network_security_group_id = module.nsg.id

  tags = var.tags
}

module "vm" {
  source = "../../modules/compute/vm"

  name                = var.vm_name
  location            = var.location
  resource_group_name = module.resource_group.name

  vm_size        = var.vm_size
  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_ids = [
    module.nic.id
  ]

  os_disk_type = "Standard_LRS"

  image = {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  tags = var.tags
}