
output "location" {
  value = var.location
}

output "resource_group_ids" {
  value = { for k, rg in azurerm_resource_group.k8s-rg : k => rg.id }
}

output "resource_group_name_id_only" {
  value = { for k, rg in azurerm_resource_group.k8s-rg : k => rg.name }
}

### Jezeli jest lista
#output "resource_group_names_only" {
#  value = [for rg in azurerm_resource_group.k8s-rg : rg.name]
#}

output "map_keys_only" {
  value = keys(azurerm_resource_group.k8s-rg)
}

# Zmapy(slownika) na liste
output "names_list" {
  value = [for _, edzio in azurerm_resource_group.k8s-rg : edzio.name]
}

###
### AKS Cluster ###
###
### Azure AKS Versions Datasource ###
#output "versions" {
#  value = data.azurerm_kubernetes_service_versions.current.versions
#}

output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.aks_cluster.id
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.name
}

output "versions" {
  value = { for key, version_info in data.azurerm_kubernetes_service_versions.current : key => version_info.versions }
}

output "latest_version" {
  value = { for key, verion_latest_info in data.azurerm_kubernetes_service_versions.current : key => verion_latest_info.latest_version }
}

output "azure_ad_group_id" {
  value = azuread_group.aks_administrator.id
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive = true
}