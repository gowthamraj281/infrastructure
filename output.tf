output "resource_group_name" {
  value       = azurerm_resource_group.resource-group.name
  description = "It Displays a Resource Group Name"
}

output "azurerm_linux_virtual_machine" {
  value       = azurerm_linux_virtual_machine.linux-vm.name
  description = "It Diaplays a Linux Virtual Machine Name"
}

output "azurerm_windows_virtual_machine" {
  value       = azurerm_windows_virtual_machine.win-vm.name
  description = "It Displays a Windows Virtual Machine Name"
}

/*output "random_password" {
  value       = random_password.password.result
  sensitive   = true
}*/

output "random_password_plain_text" {
  value = nonsensitive(random_password.password.result)
}
