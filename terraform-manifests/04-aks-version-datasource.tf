# Datasource to get Latest Azure AKS latest version
data "azurerm_kubernetes_service_versions" "current" {
  for_each = azurerm_resource_group.k8s-rg

  location        = each.value.location
  include_preview = false
}

data "azurerm_kubernetes_service_versions" "latest" {
  location        = var.location
  include_preview = false
}

