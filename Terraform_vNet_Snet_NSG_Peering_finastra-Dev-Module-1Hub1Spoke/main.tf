module "network" {
  source          = "./modules/network"
  sldr            = "HUB-Test"
  location        = "canadacentral"
  vnet1           = "HUB-SLDR"
  vnet1_space     = ["0.0.0.0/0"]
  
  subnet1         = "CSR-Internal"
  subnet1_space   = ["0.0.0.0/0"]
  nsg1            = "CSR-Internal"
  
  subnet2         = "CSR-External"
  subnet2_space   = ["0.0.0.64/0"]
  nsg2           = "CSR-External"

  subnet3         = "FG-Internal"
  subnet3_space   = ["0.0.0.128/0"]
  nsg3            = "FG-Internal"

#DR Spoke
  dr              = "Spoke-Test"
  vnet2           = "Spoke-Test"
  vnet2_space     = ["0.0.10.0/0"]
  
  subnet01         = "Apps01"
  subnet01_space   = ["0.0.10.0/0"]
  nsg01            = "Apps01"
  rt01             = "SpokeApps01ToHubSLDR"
  
  subnet02         = "Apps02"
  subnet02_space   = ["0.0.11.0/0"]
  nsg02           = "Apps02"
  rt02            = "SpokeApps02ToHubSLDR"


#rt01 for spoke 01 subnet
rt01_rule         = "SpokeApps01ToFG"
rt01_space        = "0.0.0.0/0"  #FG Internal Subnet
rt01_nht          = "VirtualAppliance"
rt01_nhip         = "0.0.0.10" #FG IP

#rt02 for spoke 02 subnet
rt02_rule         = "SpokeApps02ToFG"
rt02_space        = "0.0.0.0/0" #FG Internal Subnet
rt02_nht          = "VirtualAppliance"
rt02_nhip         = "0.0.0.10" #FG IP



}
