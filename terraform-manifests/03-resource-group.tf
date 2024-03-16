
resource "azurerm_resource_group" "k8s-rg" {
  for_each = var.resource_groups

  name     = "${each.key}-${var.environment}"
  location = each.value.location

  tags = each.value.tags
}

resource "azurerm_resource_group" "k8s-rg-single" {
  name     = "k8s-${var.environment}"
  location = "West Europe"

  tags = {
    "rg" = "k8s-dev"
  }
}

