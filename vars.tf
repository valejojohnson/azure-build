variable "resource_group_location" {
  type        = string
  default     = "westus2"
  description = "Location of the default resource group."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "terraformed"
  description = "Prefix for the name of the default resource group."
}

variable "default_username" {
  type        = string
  default     = "masteruser"
  description = "Master Username"
}