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