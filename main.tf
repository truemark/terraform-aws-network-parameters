locals {
  tags = {
    "truemark:automation:component-id": "network-parameters"
    "truemark:automation:component-url": "https://registry.terraform.io/modules/truemark/network-parameters/aws/latest",
    "truemark:automation:component-vendor": "TrueMark"
  }
  path = "${var.prefix}/${var.name}"
  vpc_path = "${local.path}/vpc"
  azs_path = "${local.path}/azs"
  public_subnets_path = "${local.path}/public_subnets"
  private_subnets_path = "${local.path}/private_subnets"
  public_albs_path = "${local.path}/public_albs"
  private_albs_path = "${local.path}/privatae_albs"
}

resource "aws_ssm_parameter" "vpc" {
  count = var.create && var.vpc_id != null ? 1 : 0
  name  = local.vpc_path
  type  = "String"
  value = var.vpc_id
  tags = merge(var.tags, var.suppress_tagging ? {} : local.tags)
}

resource "aws_ssm_parameter" "azs" {
  count = var.create && var.azs != null ? 1 : 0
  name  = local.azs_path
  type  = "StringList"
  value = join(",", var.azs)
  tags = merge(var.tags, var.suppress_tagging ? {} : local.tags)
}

resource "aws_ssm_parameter" "public_subnets" {
  count = var.create && var.public_subnet_ids != null ? 1 : 0
  name  = local.public_subnets_path
  type  = "StringList"
  value = join(",", var.public_subnet_ids)
  tags = merge(var.tags, var.suppress_tagging ? {} : local.tags)
}

resource "aws_ssm_parameter" "private_subnets" {
  count = var.create && var.private_subnet_ids != null ? 1 : 0
  name  = local.private_subnets_path
  type  = "StringList"
  value = join(",", var.private_subnet_ids)
  tags = merge(var.tags, var.suppress_tagging ? {} : local.tags)
}

resource "aws_ssm_parameter" "public_albs" {
  count = var.create && var.public_alb_arns != null ? 1 : 0
  name  = local.public_albs_path
  type  = "StringList"
  value = join(",", var.public_alb_arns)
  tags = merge(var.tags, var.suppress_tagging ? {} : local.tags)
}

resource "aws_ssm_parameter" "private_albs" {
  count = var.create && var.private_alb_arns != null ? 1 : 0
  name  = local.private_albs_path
  type  = "StringList"
  value = join(",", var.private_alb_arns)
  tags = merge(var.tags, var.suppress_tagging ? {} : local.tags)
}

data "aws_ssm_parameters_by_path" "this" {
  path = local.path
}

locals {
  parameter_map = tomap({
    for i, name in data.aws_ssm_parameters_by_path.this.names:
    name => nonsensitive(data.aws_ssm_parameters_by_path.this.values[i])
  })
  vpc_id = try(local.parameter_map[local.vpc_path], null)
  azs = try(split(",", local.parameter_map[local.azs_path]), null)
  public_subnet_ids = try(split(",", local.parameter_map[local.public_subnets_path]), null)
  private_subnet_ids = try(split(",", local.parameter_map[local.private_subnets_path]), null)
  public_alb_arns = try(split(",", local.parameter_map[local.public_albs_path]), null)
  private_alb_arns = try(split(",", local.parameter_map[local.private_albs_path]), null)
}
