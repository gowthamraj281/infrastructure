#Network Security Group
resource "azurerm_network_security_group" "nsg" {
  name                = "${var.nsg}-nsg"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name


  security_rule {
    name                       = "Task-Rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["3389", "22"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

resource "azurerm_subnet_network_security_group_association" "WAN_nsgassociation" {
  subnet_id                 = azurerm_subnet.WAN_Subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_subnet_network_security_group_association" "LAN_nsgassociation" {
  subnet_id                 = azurerm_subnet.LAN_Subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
