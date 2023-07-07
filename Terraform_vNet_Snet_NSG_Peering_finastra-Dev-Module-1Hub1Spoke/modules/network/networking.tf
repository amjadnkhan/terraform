#Ths is creation of 2 vnets and subnets, one in SLDR and one DR
#create NSGs and assocated with each subnet 
#create vnet peering between SLDR-Hub with SLDR-Spoke


resource "azurerm_resource_group" "sldr" {
  provider = azurerm.sldr-sub
  name     = var.sldr
  location = var.location
}

resource "azurerm_virtual_network" "vnet1" {
  provider = azurerm.sldr-sub
  name                = var.vnet1 #"SLDR-HUB"
  address_space       = var.vnet1_space # ["10.235.0.0/23"]
  location            = azurerm_resource_group.sldr.location
  resource_group_name = azurerm_resource_group.sldr.name
}


resource "azurerm_subnet" "subnet1" {
  provider = azurerm.sldr-sub
  name                 = var.subnet1 #"SLDR-Internal"
  resource_group_name  = azurerm_resource_group.sldr.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = var.subnet1_space # ["10.235.0.0/27"]
}

resource "azurerm_network_security_group" "nsg1" {
  provider = azurerm.sldr-sub
  name                = var.nsg1 #"SLDR-Internal"
  location            = azurerm_resource_group.sldr.location
  resource_group_name = azurerm_resource_group.sldr.name
}

resource "azurerm_subnet_network_security_group_association" "subnet1_association" {
  provider = azurerm.sldr-sub
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}

# resource "azurerm_route_table" "rt1" {
#   provider = azurerm.sldr-sub
#   name                = "SLDR-Internal"
#   location            = azurerm_resource_group.sldr.location
#   resource_group_name = azurerm_resource_group.sldr.name
# }

# resource "azurerm_subnet_route_table_association" "subnet1_association_RT" {
#   provider = azurerm.sldr-sub
#   subnet_id                 = azurerm_subnet.subnet1.id
#   route_table_id = azurerm_route_table.rt1.id
# }



resource "azurerm_subnet" "subnet2" {
  provider = azurerm.sldr-sub
  name                 = var.subnet2 # "SLDR-External"
  resource_group_name  = azurerm_resource_group.sldr.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = var.subnet2_space #["10.235.0.64/27"]
}

resource "azurerm_network_security_group" "nsg2" {
  provider = azurerm.sldr-sub
  name                = var.nsg2 #"SLDR-External"
  location            = azurerm_resource_group.sldr.location
  resource_group_name = azurerm_resource_group.sldr.name
}

resource "azurerm_subnet_network_security_group_association" "subnet2_association" {
  provider = azurerm.sldr-sub
  subnet_id                 = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.nsg2.id
}



resource "azurerm_subnet" "subnet3" {
  provider = azurerm.sldr-sub
  name                 = var.subnet3 #"SLDR-FW"
  resource_group_name  = azurerm_resource_group.sldr.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = var.subnet3_space #["10.235.0.128/27"]
}

resource "azurerm_network_security_group" "nsg3" {
  provider = azurerm.sldr-sub
  name                = var.nsg3#"SLDR-FW"
  location            = azurerm_resource_group.sldr.location
  resource_group_name = azurerm_resource_group.sldr.name
}

resource "azurerm_subnet_network_security_group_association" "subnet3_association" {
  provider = azurerm.sldr-sub
  subnet_id                 = azurerm_subnet.subnet3.id
  network_security_group_id = azurerm_network_security_group.nsg3.id
}

###################################################################

resource "azurerm_resource_group" "dr" {
  provider = azurerm.dr-sub
  name     = var.dr
  location = var.location
}
resource "azurerm_virtual_network" "vnet2" {
  provider = azurerm.dr-sub
  name                = var.vnet2 #"Dr-Spoke"
  address_space       = var.vnet2_space#["10.235.10.0/23"]
  location            = azurerm_resource_group.dr.location
  resource_group_name = azurerm_resource_group.dr.name
}

#Apps01 subnet01

resource "azurerm_subnet" "subnet01" {
  provider = azurerm.dr-sub
  name                 = var.subnet01#"DR-Apps01"
  resource_group_name  = azurerm_resource_group.dr.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = var.subnet01_space#["10.235.10.0/24"]
}

resource "azurerm_network_security_group" "nsg01" {
  provider = azurerm.dr-sub
  name                = var.nsg01#"DR-Apps01"
  location            = azurerm_resource_group.dr.location
  resource_group_name = azurerm_resource_group.dr.name
}

resource "azurerm_subnet_network_security_group_association" "subnet01_association" {
  provider = azurerm.dr-sub
  subnet_id                 = azurerm_subnet.subnet01.id
  network_security_group_id = azurerm_network_security_group.nsg01.id
}

#####RouteTable01 for DR Apps01 subnet and subscription

resource "azurerm_route_table" "rt01" {
  provider = azurerm.dr-sub
  name                = var.rt01#"SpokeApps01ToHubSLDR"
  location            = azurerm_resource_group.dr.location
  resource_group_name = azurerm_resource_group.dr.name
}

resource "azurerm_subnet_route_table_association" "subnet01_association_RT01" {
  provider = azurerm.dr-sub
  subnet_id                 = azurerm_subnet.subnet01.id
  route_table_id = azurerm_route_table.rt01.id
}

#App02Subnet

resource "azurerm_subnet" "subnet02" {
  provider = azurerm.dr-sub
  name                 = var.subnet02#"DR-Apps02"
  resource_group_name  = azurerm_resource_group.dr.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = var.subnet02_space #["10.235.11.0/24"]
}

resource "azurerm_network_security_group" "nsg02" {
  provider = azurerm.dr-sub
  name                = var.nsg02 #"DR-Apps02"
  location            = azurerm_resource_group.dr.location
  resource_group_name = azurerm_resource_group.dr.name
}

resource "azurerm_subnet_network_security_group_association" "subnet02_association" {
  provider = azurerm.dr-sub
  subnet_id                 = azurerm_subnet.subnet02.id
  network_security_group_id = azurerm_network_security_group.nsg02.id
}

#####RouteTable01 for DR Apps01 subnet and subscription

resource "azurerm_route_table" "rt02" {
  provider = azurerm.dr-sub
  name                = var.rt02#"SpokeApps02ToHubSLDR"
  location            = azurerm_resource_group.dr.location
  resource_group_name = azurerm_resource_group.dr.name
}

resource "azurerm_subnet_route_table_association" "subnet02_association_RT02" {
  provider = azurerm.dr-sub
  subnet_id                 = azurerm_subnet.subnet02.id
  route_table_id = azurerm_route_table.rt02.id
}
