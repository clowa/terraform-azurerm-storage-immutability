# Overview

This is just a example using the [azapi provider](https://registry.terraform.io/providers/Azure/azapi) showing how to manage resources not _yet_ supported by the [azurerm provider](https://registry.terraform.io/providers/hashicorp/azurerm).

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | >=0.1.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.4.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >=3.1.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | 0.1.1 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.4.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azapi_update_resource.this](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/update_resource) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [random_id.this](https://registry.terraform.io/providers/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_etag"></a> [etag](#output\_etag) | This output maybe isn't properly decoded and should be improved |
<!-- END_TF_DOCS -->
