################################################################################
# Project
################################################################################

variable "project_id" {
  description = "Project ID in which clusters are deployed"
  type        = string
}
variable "region" {
  description = "Region to deploy your cluster in"
  type        = string
}
variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
}
# variable "tags" {
#   description = "A map of tags to add to all resources"
#   type        = map(string)
#   default     = {}
# }

################################################################################
# Network
################################################################################
variable "shim" {
  description = "If true will not create the network and forward the input values to the same outputs."
  type        = bool
  default     = false
}

variable "shared_vpc" {
  description = "If true, the shim network is a shared VPC"
  type        = bool
  default     = false
}

################################################################################
# Network SHIM
################################################################################
variable "network_name" {
  description = "SHIM: network name"
  type        = string
}
variable "subnet_id" {
  description = "SHIM: Subnetwork ID"
  type        = string
}

################################################################################
# Shared VPC
################################################################################

variable "shared_vpc_host_project" {
  description = "Shared VPC: Project ID of the host project"
  type        = string
  default     = ""
}

variable "shared_vpc_network_name" {
  description = "Shared VPC: Network name"
  type        = string
  default     = ""
}

variable "shared_vpc_subnet_name" {
  description = "Shared VPC: Subnet name"
  type        = string
  default     = ""
}
################################################################################
# Network NON-SHIM
################################################################################

variable "routing_mode" {
  description = "Routing mode for the network"
  type        = string
  default     = "GLOBAL"
}
variable "private_subnet_cidr" {
  description = "CIDR range for private subnet"
  type        = string
  default     = ""
}
variable "network_vpc_secondary_ranges" {
  description = "List of secondary ranges"
  type = list(object({
    range_name    = string
    ip_cidr_range = string
  }))
}

variable "enable_private_access" {
  description = "Private access for subnets"
  type        = bool
  default     = true
}

variable "enable_flow_logs" {
  description = "Enable flow logs for subnets"
  type        = bool
  default     = false
}
