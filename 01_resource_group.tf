# Resource group
resource "azurerm_resource_group" "resource-group" {
  name     = var.name
  location = var.location
  lifecycle {
    prevent_destroy = false
  }
}
