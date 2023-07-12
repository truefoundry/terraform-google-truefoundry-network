# From https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/variables.tf

################################################################################
# Network
################################################################################
variable "shim" {
  description = "If true will not create the network and forward the input values to the same outputs."
  type        = bool
  default     = false
}
### Shim

variable "network_name" {
  description = "SHIM: network name"
  type        = string
}
variable "subnetwork_id" {
  description = "SHIM: Subnetwork ID"
  type        = string
}

### Non shim


variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
}

variable "network_vpc_secondary_ranges" {
  description = "List of secondary ranges"
  type        = list(any)
}

variable "network_vpc_cidr" {
  description = "VPC CIDR"
}

################################################################################
# Generic
################################################################################


variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "region" {
  description = "region"
  type        = string
}

variable "project" {
  description = "GCP Project"
  type        = string
}