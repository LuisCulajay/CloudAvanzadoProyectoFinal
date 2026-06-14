variable "resource_group_name" {
  description = "Nombre del Resource Group existente"
  type        = string
  default     = "rg-aks-terraform"
}

variable "location" {
  description = "Region de Azure"
  type        = string
  default     = "eastus"
}

variable "cluster_name" {
  description = "Nombre del cluster AKS"
  type        = string
  default     = "aks-demo-cluster"
}

variable "dns_prefix" {
  description = "Prefijo DNS del cluster"
  type        = string
  default     = "aksdemo"
}

variable "node_count" {
  description = "Numero de nodos en el node pool"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "Tamano de las VMs del node pool"
  type        = string
  default     = "Standard_B2s"
}

variable "ssh_public_key" {
  description = "Llave publica SSH para acceso a los nodos AKS"
  type        = string
}