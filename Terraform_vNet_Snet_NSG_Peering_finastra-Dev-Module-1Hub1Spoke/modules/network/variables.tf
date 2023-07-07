
#SLDR HUB
variable "sldr" {}
variable "location" {}
variable "vnet1" {}
variable "vnet1_space"{}

variable "subnet1" {}
variable "subnet1_space"{}
variable "nsg1"{}

variable "subnet2" {}
variable "subnet2_space"{}
variable "nsg2"{}

variable "subnet3" {}
variable "subnet3_space"{}
variable "nsg3"{}

#DR Spoke
variable "dr" {}
variable "vnet2" {}
variable "vnet2_space"{}

variable "subnet01" {}
variable "subnet01_space"{}
variable "nsg01"{}
variable "rt01"{}

variable "subnet02" {}
variable "subnet02_space"{}
variable "nsg02"{}
variable "rt02"{}

#RouteTableForSpokeSubnets

#rt01 for spoke 01 subnet
variable "rt01_rule" {}
variable "rt01_space" {}
variable "rt01_nht"{}
variable "rt01_nhip"{}

#rt02 for spoke 02 subnet
variable "rt02_rule" {}
variable "rt02_space" {}
variable "rt02_nht"{}
variable "rt02_nhip"{}
