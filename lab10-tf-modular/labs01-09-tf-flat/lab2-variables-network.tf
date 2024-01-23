provider "azurerm" {
  features {}
  version = "~> 2.0"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      
    }
  }
  
}
variable "rg2" {
  default     = "TerraformRG"
  type        = string
  description = "This resource group is to host all test infra."
}

variable "location" {
  default = "canadacentral"
}

variable "vnet" {
  default = "network-vnet"
}

variable "vnet_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet" {
  default = "network-subnet01"
}

variable "subnet_space" {
  default = ["10.0.1.0/24"]
}

variable "nsg" {
  default = "network-nsg01"
}

