resource "azuread_group" "aks_administrator" {
  display_name = "${azurerm_resource_group.k8s-rg-single.name}-cluster-administrator"
  description  = "Azure AKS Kubernetes administrators for the ${azurerm_resource_group.k8s-rg-single.name}-cluster."
  mail_enabled = false
  security_enabled = true
}

