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
variable "network_profile" {
  type        = string
  default     = null
  description = <<-EOT
    "A full or partial URL of the network profile to apply to this network.
    This field can be set only at resource creation time. For example, the
    following are valid URLs:
      * https://www.googleapis.com/compute/beta/projects/{projectId}/global/networkProfiles/{network_profile_name}
      * projects/{projectId}/global/networkProfiles/{network_profile_name}
    EOT
}
# variable "tags" {
#   description = "A map of tags to add to all resources"
#   type        = map(string)
#   default     = {}
# }

################################################################################
# Network
################################################################################

variable "use_existing_network" {
  description = "If true will not create the network and forward the input values to the same outputs."
  type        = bool
  default     = false
}

################################################################################
# Network SHIM
################################################################################
variable "network_id" {
  description = "ID of the existing network. Only used when use_existing_network is set to true"
  type        = string
  default     = ""
}

variable "subnet_id" {
  description = "ID of the existing subnet. Only used when use_existing_network is set to true"
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
  default = []
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
