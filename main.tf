locals {
  tags = {
    "truemark:automation:component-id": "network-parameters"
    "truemark:automation:component-url": "https://registry.terraform.io/modules/truemark/network-parameters/aws/latest",
    "truemark:automation:component-vendor": "TrueMark"
  }
}

resource "aws_ssm_parameter" "vpc" {
  count = var.create ? 1 : 0
  name  = "${var.prefix}/${var.name}/vpc"
  type  = "String"
  value = var.vpc_id
  tags = merge(var.tags, var.suppress_tagging ? {} : local.tags)
}

resource "aws_ssm_parameter" "azs" {
  count = var.create && var.azs == null ? 0 : 1
  name  = "${var.prefix}/${var.name}/azs"
  type  = "StringList"
  value = join(",", var.azs)
  tags = merge(var.tags, var.suppress_tagging ? {} : local.tags)
}

resource "aws_ssm_parameter" "public_subnets" {
  count = var.create && var.public_subnets == null ? 0 : 1
  name  = "${var.prefix}/${var.name}/public_subnets"
  type  = "StringList"
  value = join(",", var.public_subnets)
  tags = merge(var.tags, var.suppress_tagging ? {} : local.tags)
}

resource "aws_ssm_parameter" "private_subnets" {
  count = var.create && var.private_subnets == null ? 0 : 1
  name  = "${var.prefix}/${var.name}/private_subnets"
  type  = "StringList"
  value = join(",", var.private_subnets)
  tags = merge(var.tags, var.suppress_tagging ? {} : local.tags)
}

resource "aws_ssm_parameter" "private_albs" {
  count = var.create && var.private_albs == null ? 0 : 1
  name  = "${var.prefix}/${var.name}/private_albs"
  type  = "StringList"
  value = join(",", var.private_albs)
  tags = merge(var.tags, var.suppress_tagging ? {} : local.tags)
}

resource "aws_ssm_parameter" "public_albs" {
  count = var.create && var.public_albs == null ? 0 : 1
  name  = "${var.prefix}/${var.name}/public_albs"
  type  = "StringList"
  value = join(",", var.public_albs)
  tags = merge(var.tags, var.suppress_tagging ? {} : local.tags)
}
