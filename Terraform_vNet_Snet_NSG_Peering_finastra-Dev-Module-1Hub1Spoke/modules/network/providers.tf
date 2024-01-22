terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

# provider "azurerm" {
#   alias                         = "sldev-sub"
#   subscription_id = 
#   tenant_id              = 
#   features {}
# }
# provider "azurerm" {
#   alias                         = "dev-sub"
#   subscription_id = 
#   tenant_id              = "
#   features {}
# }

provider "azurerm" {
  alias                         = "sldr-sub"
  subscription_id = 
  tenant_id              = "
  features {}
}
provider "azurerm" {
  alias                         = "dr-sub"
  subscription_id = 
  tenant_id              = 
  features {}
}
