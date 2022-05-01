provider "azurerm" {
  features {}
  skip_provider_registration = true
}

provider "azapi" {
  skip_provider_registration = true
}

variable "app_name" {
  type = string
}

variable "tags" {
  type = map(any)
}

locals {
  tags = merge({
    "managed-by" = "terraform"
  }, var.tags)
}

resource "random_id" "this" {
  byte_length = 8
}

resource "azurerm_resource_group" "this" {
  name     = upper("RG-${var.app_name}")
  location = "Germany West Central"
}

resource "azurerm_storage_account" "this" {
  name                     = lower("SA0${var.app_name}0${random_id.this.hex}")
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.tags
}

resource "azurerm_storage_container" "this" {
  name                  = lower("BLB-${var.app_name}")
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}

# resource "azapi_resource" "this" {
#   type      = "Microsoft.Storage/storageAccounts/blobServices/containers/immutabilityPolicies@2021-08-01"
#   name      = "default"
#   parent_id = azurerm_storage_container.this.resource_manager_id

#   body = jsonencode({
#     properties = {
#       allowProtectedAppendWrites            = false
#       allowProtectedAppendWritesAll         = null
#       immutabilityPeriodSinceCreationInDays = 1
#     }
#   })
#     response_export_values = ["properties.etag"]
# }

# For some reason the immutable policy must be treated as an existing resource
resource "azapi_update_resource" "this" {
  type      = "Microsoft.Storage/storageAccounts/blobServices/containers/immutabilityPolicies@2021-08-01"
  name      = "default" #! do not change
  parent_id = azurerm_storage_container.this.resource_manager_id

  body = jsonencode({
    properties = {
      allowProtectedAppendWrites = false
      # allowProtectedAppendWritesAll         = null
      immutabilityPeriodSinceCreationInDays = 4
    }
  })
  response_export_values = ["etag"]
}

# This output maybe isn't properly decoded and should be improved
output "etag" {
  value = jsondecode(azapi_update_resource.this.output).etag
}