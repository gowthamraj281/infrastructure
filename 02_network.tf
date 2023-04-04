## Virtual network for Virtual Machines 
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnetname}-vnet"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  address_space       = ["10.10.10.0/24"]
}

#Subnet for the Windows Virtual Machine
resource "azurerm_subnet" "WAN_Subnet" {
  name                 = "${var.subnet_WAN}-WAN_Subnet"
  resource_group_name  = azurerm_resource_group.resource-group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.10.0/27"]
}

#Subnet For Linux Virtual Machine
resource "azurerm_subnet" "LAN_Subnet" {
  name                 = "${var.subnet_LAN}-LAN_Subnet"
  resource_group_name  = azurerm_resource_group.resource-group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.10.32/27"]
}

#Create public IPs for Windows Machine
resource "azurerm_public_ip" "win_public_ip" {
  name                = "${var.Public-IP}-windows-PublicIP"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  allocation_method   = "Static"
}

#Create public IPs for Linux Machines
resource "azurerm_public_ip" "linux_public_ip" {
  name                = "${var.Public-IP}-linux-PublicIP"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  allocation_method   = "Static"
}

#Create a network interface for Windows machine
resource "azurerm_network_interface" "win_nic" {
  name                = "${var.win_nic}-nic"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name

  ip_configuration {
    name                          = "windows"
    subnet_id                     = azurerm_subnet.WAN_Subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.win_public_ip.id
  }
}

#Create a network interface for Linux machine
resource "azurerm_network_interface" "linux_nic" {
  name                = "${var.lin_nic}-nic"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name


  ip_configuration {
    name                          = "linux"
    subnet_id                     = azurerm_subnet.LAN_Subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux_public_ip.id
  }
}


