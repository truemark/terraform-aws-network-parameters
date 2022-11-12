variable "name" {
  type = string
}

variable "prefix" {
  type = string
  default = "/network"
}

variable "vpc_id" {
  type = string
}

variable "azs" {
  type = list(string)
  default = null
}

variable "public_subnets" {
  type = list(string)
  default = null
}

variable "private_subnets" {
  type = list(string)
  default = null
}

variable "public_albs" {
  type = list(string)
  default = null
}

variable "private_albs" {
  type = list(string)
  default = null
}
