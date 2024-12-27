variable "aks_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "The resource group name which will be used for placing the resources"
  //default = "rg-aks-fehemi1"
  type        = string
}

variable "resource_group_location" {
  description = "The resource group name which will be used for placing the resources"
  default = "switzerlandnorth"
  type        = string
}

variable "key_vault_name" {
  description = "Keyvault"
  default = "keyvault-fehemi"
  type        = string
}

variable "key_vault_rg" {
  description = "Keyvault rg"
  default = "rg-aks-fehemi"
  type        = string
}

variable "tf_state_container" {
  description = "Staorage container tfstates"
  type        = string
}