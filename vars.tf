variable "resource_group_location" {
  type        = string
  default     = "westus2"
  description = "Location of the default resource group."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "test"
  description = "Prefix for the name of the default resource group."
}