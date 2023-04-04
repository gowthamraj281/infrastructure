# Random Password Generation
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

# Provision a Windows virtual machine
resource "azurerm_windows_virtual_machine" "win-vm" {
  name                  = "${var.win-vm}-vm"
  location              = azurerm_resource_group.resource-group.location
  resource_group_name   = azurerm_resource_group.resource-group.name
  network_interface_ids = [azurerm_network_interface.win_nic.id]
  size                  = "Standard_B2s"
  admin_username        = "adminuser"
  admin_password        = random_password.password.result

  os_disk {
    name                 = "win-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

# Provision a Linux virtual machine
resource "azurerm_linux_virtual_machine" "linux-vm" {
  name                            = "${var.linux-vm}-vm"
  location                        = azurerm_resource_group.resource-group.location
  resource_group_name             = azurerm_resource_group.resource-group.name
  network_interface_ids           = [azurerm_network_interface.linux_nic.id]
  size                            = "Standard_B2s"
  admin_username                  = "adminuser"
  admin_password                  = random_password.password.result
  disable_password_authentication = false

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    name                 = "linux-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}
