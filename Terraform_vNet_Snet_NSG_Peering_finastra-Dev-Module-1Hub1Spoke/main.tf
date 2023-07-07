module "network" {
  source          = "./modules/network"
  sldr            = "HUB-Test"
  location        = "canadacentral"
  vnet1           = "HUB-SLDR"
  vnet1_space     = ["10.235.0.0/23"]
  
  subnet1         = "CSR-Internal"
  subnet1_space   = ["10.235.0.0/27"]
  nsg1            = "CSR-Internal"
  
  subnet2         = "CSR-External"
  subnet2_space   = ["10.235.0.64/27"]
  nsg2           = "CSR-External"

  subnet3         = "FG-Internal"
  subnet3_space   = ["10.235.0.128/27"]
  nsg3            = "FG-Internal"

#DR Spoke
  dr              = "Spoke-Test"
  vnet2           = "Spoke-Test"
  vnet2_space     = ["10.235.10.0/23"]
  
  subnet01         = "Apps01"
  subnet01_space   = ["10.235.10.0/24"]
  nsg01            = "Apps01"
  rt01             = "SpokeApps01ToHubSLDR"
  
  subnet02         = "Apps02"
  subnet02_space   = ["10.235.11.0/24"]
  nsg02           = "Apps02"
  rt02            = "SpokeApps02ToHubSLDR"


#rt01 for spoke 01 subnet
rt01_rule         = "SpokeApps01ToFG"
rt01_space        = "10.235.0.0/27"  #FG Internal Subnet
rt01_nht          = "VirtualAppliance"
rt01_nhip         = "10.235.0.10" #FG IP

#rt02 for spoke 02 subnet
rt02_rule         = "SpokeApps02ToFG"
rt02_space        = "10.235.0.0/27" #FG Internal Subnet
rt02_nht          = "VirtualAppliance"
rt02_nhip         = "10.235.0.10" #FG IP



}