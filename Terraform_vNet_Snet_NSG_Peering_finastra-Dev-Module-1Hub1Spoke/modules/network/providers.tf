terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

# provider "azurerm" {
#   alias                         = "sldev-sub"
#   subscription_id = "5cd9901a-8b6b-4f34-83d4-fd04aa1a7026"
#   tenant_id              = "31a83df6-b522-46ac-bcbe-85c3d12e2232"
#   features {}
# }
# provider "azurerm" {
#   alias                         = "dev-sub"
#   subscription_id = "2cda43f2-3d31-4155-aafc-099c13a07b7e"
#   tenant_id              = "31a83df6-b522-46ac-bcbe-85c3d12e2232"
#   features {}
# }

provider "azurerm" {
  alias                         = "sldr-sub"
  subscription_id = "b102c36b-a0f0-48dd-a02d-d8875cc80082"
  tenant_id              = "31a83df6-b522-46ac-bcbe-85c3d12e2232"
  features {}
}
provider "azurerm" {
  alias                         = "dr-sub"
  subscription_id = "ed1dcb9a-82e6-4f32-ab60-7740ec06dd53"
  tenant_id              = "31a83df6-b522-46ac-bcbe-85c3d12e2232"
  features {}
}