variable "resource_group_location" {
  type        = string
  default     = "westus2" # West US 2 by default
  description = "Location of the default resource group."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "TF" # Meaning Terraformed
  description = "Prefix for the name of the default resource group."
}

variable "default_username" {
  type        = string
  default     = "masteruser"
  description = "The master username to be used on the VM"
}