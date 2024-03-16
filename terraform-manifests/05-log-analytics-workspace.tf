#resource "azurerm_log_analytics_workspace" "insights" {
#  for_each = azurerm_resource_group.k8s-rg
#
#  name                = random_pet.aksrandom.id
#  location            = each.value.location
#  resource_group_name = each.value.name
#  sku                 = "PerGB2018"
#  retention_in_days   = 30
#}

resource "random_pet" "aksrandom" {
  prefix    = "aks"
  length    = 3
  separator = "-"
}

resource "azurerm_log_analytics_workspace" "insights" {
  name                = random_pet.aksrandom.id
  location            = azurerm_resource_group.k8s-rg-single.location
  resource_group_name = azurerm_resource_group.k8s-rg-single.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

