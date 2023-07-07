resource "azurerm_virtual_network_peering" "peering1to2" {
  provider = azurerm.sldr-sub
  name                         = "vnet1-to-vnet2"
  resource_group_name          = azurerm_resource_group.sldr.name
  virtual_network_name         = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet2.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "peering2to1" {
  provider = azurerm.dr-sub
  name                         = "vnet2-to-vnet1"
  resource_group_name          = azurerm_resource_group.dr.name
  virtual_network_name         = azurerm_virtual_network.vnet2.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet1.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}