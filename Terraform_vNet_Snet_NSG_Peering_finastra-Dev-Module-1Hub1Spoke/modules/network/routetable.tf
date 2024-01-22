# resource "azurerm_route" "rt_rule1" {
#   provider = azurerm.sldr-sub
#   name                        = "route1"
#   address_prefix                    = "0.0.0.0/0"
#   next_hop_type                   = "VirtualAppliance"
#   next_hop_in_ip_address                      = "" 
#   resource_group_name         = azurerm_resource_group.sldr.name
#   route_table_name = azurerm_route_table.rt1.name
# }

# resource "azurerm_route" "rt_rule2" {
#   provider = azurerm.sldr-sub
#   name                        = "route1"
#   address_prefix                    = "0.0.0.0/0"
#   next_hop_type                   = "VirtualAppliance"
#   next_hop_in_ip_address                      = ""
#   resource_group_name         = azurerm_resource_group.sldr.name
#   route_table_name = azurerm_route_table.rt2.name
# }
# resource "azurerm_route" "rt_rule3" {
#   provider = azurerm.sldr-sub
#   name                        = "route1"
#   address_prefix                    = "0.0.0.0/0"
#   next_hop_type                   = "VirtualAppliance"
#   next_hop_in_ip_address                      = ""
#   resource_group_name         = azurerm_resource_group.sldr.name
#   route_table_name = azurerm_route_table.rt3.name
# }


# #########################
# #Dr Subscription, rt rule 01 and 02 for vnet2 subnets 01\02
#DR Spoke to Hub Internal Subnet

resource "azurerm_route" "rt_rule01" {
  provider = azurerm.dr-sub
  name                           = var.rt01_rule #"SpokeToRoute"
  address_prefix                 = var.rt01_space 
  next_hop_type                  = var.rt01_nht #"VirtualAppliance"
  next_hop_in_ip_address         = var.rt01_nhip 
  resource_group_name            = azurerm_resource_group.dr.name
  route_table_name               = azurerm_route_table.rt01.name
}

resource "azurerm_route" "rt_rule02" {
  provider = azurerm.dr-sub
  name                          = var.rt02_rule #"SpokeToRoute"
  address_prefix                = var.rt02_space
  next_hop_type                 = var.rt02_nht#"VirtualAppliance"
  next_hop_in_ip_address        = var.rt02_nhip
  resource_group_name           = azurerm_resource_group.dr.name
  route_table_name              = azurerm_route_table.rt02.name
}
