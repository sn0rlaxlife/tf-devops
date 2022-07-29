#compute will house our VM's

resource "azurerm_resource_group" "sugar-1" {
    name            = "dev-machine100"
    location        = "West US"
    subnet1         = "office-sub"
    subnet_names    = ["subnet1"]
}


module "linuxservers" {
    source              = "Azure/compute/azurerm"
    resource_group_name = azurerm_resource_group.sugar-1.name
    vm_os_simple        = "UbuntuServer"
    public_ip_dns       = ["dev-center-1"]
    vnet_subnet_id      = module.network.vnet_subnets[*]

    depends_on = [azurerm_resource_group.sugar-1]
}

module "windowsservers" {
    source              = "Azure/compute/azurerm"
    resource_group_name = azurerm_resource_group.sugar-1.name
    is_windows_images   = true
    vm_hostname         = "dev-workspace1"
    admin_password      = "azure-pv1"
}

module "network" {
  source              = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.sugar-1.name
  subnet_prefixes     = ["10.0.1.0/24"]
  subnet_names        = ["Office-LA"]

  depends_on = [azurerm_resource_group.sugar-1]
}

output "linux_vm_public_name" {
  value = module.linuxservers.public_ip_dns_name
}

output "windows_vm_public_name" {
  value = module.windowsservers.public_ip_dns_name
}