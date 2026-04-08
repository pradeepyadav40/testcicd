variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "nsg_name" {
  description = "Name of the network security group."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet to associate with the NSG."
  type        = string
}

variable "allow_rdp_from_internet" {
  description = "Whether to allow RDP from the internet."
  type        = bool
  default     = false
}

variable "allowed_rdp_source_ips" {
  description = "List of CIDR blocks allowed to access RDP. Used when allow_rdp_from_internet is true."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "Tags to apply to security resources."
  type        = map(string)
  default     = {}
}
