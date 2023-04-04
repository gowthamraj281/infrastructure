variable "name" {
  type        = string
  description = "assiging the name for the resource group name"
}

variable "location" {
  type        = string
  description = "assigning the location"
}

variable "win-vm" {
  type        = string
  description = "assigning the windows machine name"
}

variable "linux-vm" {
  type        = string
  description = "assigning the linux machine name"
}

variable "vnetname" {
  type        = string
  description = "assigning the virtual network name"
}

variable "subnet_LAN" {
  type        = string
  description = "assigning the name for LAN subnet"
}

variable "subnet_WAN" {
  type        = string
  description = "assigning the name for WAN subnet"
}

variable "win_nic" {
  type        = string
  description = "assigning the name for Windows NIC card"
}

variable "lin_nic" {
  type        = string
  description = "assigning the name for Linux NIC card"
}

variable "Public-IP" {
  type        = string
  description = "assigning the name for Public IP network of LAN"
}

variable "nsg" {
  type        = string
  description = "assigning the name for NSG"
}
