resource "azurerm_network_security_rule" "nsg_rule1" {
  provider = azurerm.sldr-sub
  name                        = "Allow-SSH"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.sldr.name
  network_security_group_name = azurerm_network_security_group.nsg1.name
}

resource "azurerm_network_security_rule" "nsg_rule2" {
  provider = azurerm.sldr-sub
  name                        = "Allow-SSH"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.sldr.name
  network_security_group_name = azurerm_network_security_group.nsg2.name
}
resource "azurerm_network_security_rule" "nsg_rule3" {
  provider = azurerm.sldr-sub
  name                        = "Allow-SSH"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.sldr.name
  network_security_group_name = azurerm_network_security_group.nsg3.name
}


#########################
#Dr Subscription, NSG rule 01 and 02 for vnet2 subnets 01\02

#NSG1 Rules

resource "azurerm_network_security_rule" "nsg_rule01" {
  provider = azurerm.dr-sub
  name                        = "Allow-SSH"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.dr.name
  network_security_group_name = azurerm_network_security_group.nsg01.name
}

#NSG2 Rules

resource "azurerm_network_security_rule" "nsg_rule02" {
  provider = azurerm.dr-sub
  name                        = "Allow-SSH"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.dr.name
  network_security_group_name = azurerm_network_security_group.nsg02.name
}