variable "name" {
  description = "Network name"
  type = string
}

variable "prefix" {
  description = "Prefix to use on created parameters."
  type = string
  default = "/network"
}

variable "vpc_id" {
  description = "ID of the VPC for this network"
  type = string
}

variable "azs" {
  description = "Availability zones for this network"
  type = list(string)
  default = null
}

variable "public_subnets" {
  description = "Public subnet IDs in this network"
  type = list(string)
  default = null
}

variable "private_subnets" {
  description = "Private subnets IDs in this network"
  type = list(string)
  default = null
}

variable "public_albs" {
  description = "Public ALB ARNs in this network"
  type = list(string)
  default = null
}

variable "private_albs" {
  description = "Private ALB ARNs in this network "
  type = list(string)
  default = null
}

variable "tags" {
  description = "Tags to apply to resources created by this module."
  type = map(string)
  default = {}
}

variable "suppress_tagging" {
  description = "Set this to true to suppress built-in tags from being added to resources."
  type = bool
  default = false
}
