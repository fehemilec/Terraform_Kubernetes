resource "azurerm_resource_group" "rgroup" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name = var.aks_name
  location = var.resource_group_location
  resource_group_name = var.resource_group_name
  dns_prefix = "aksclusterfehemi"
  depends_on = [azurerm_resource_group.rgroup]

identity {
  type = "SystemAssigned"
}

key_vault_secrets_provider {
    secret_rotation_enabled = true
}


default_node_pool {
  name = "default"
  node_count = 1
  vm_size = "Standard_DS2_v2"
}
  
}

###################################
# grant kubelet access to keyvault
###################################
# Role Assignment for Key Vault
resource "azurerm_role_assignment" "key_vault_access" {
  principal_id   = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name = "Key Vault Secrets User" # Grant access to secrets
  scope          = data.azurerm_key_vault.kv.id
}


output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config
  sensitive = true
  
}

output "kubelet_identity_client_id" {
  value = azurerm_kubernetes_cluster.aks.kubelet_identity[0].client_id
}
