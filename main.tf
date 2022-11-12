resource "aws_ssm_parameter" "vpc" {
  name  = "${var.prefix}/${var.name}/vpc"
  type  = "String"
  value = var.vpc_id
}

resource "aws_ssm_parameter" "azs" {
  count = var.azs == null ? 0 : 1
  name  = "${var.prefix}/${var.name}/azs"
  type  = "StringList"
  value = join(",", var.azs)
}

resource "aws_ssm_parameter" "public_subnets" {
  count = var.public_subnets == null ? 0 : 1
  name  = "${var.prefix}/${var.name}/public_subnets"
  type  = "StringList"
  value = join(",", var.public_subnets)
}

resource "aws_ssm_parameter" "private_subnets" {
  count = var.private_subnets == null ? 0 : 1
  name  = "${var.prefix}/${var.name}/private_subnets"
  type  = "StringList"
  value = join(",", var.private_subnets)
}

resource "aws_ssm_parameter" "private_albs" {
  count = var.private_albs == null ? 0 : 1
  name  = "${var.prefix}/${var.name}/private_albs"
  type  = "StringList"
  value = join(",", var.private_albs)
}

resource "aws_ssm_parameter" "public_albs" {
  count = var.public_albs == null ? 0 : 1
  name  = "${var.prefix}/${var.name}/public_albs"
  type  = "StringList"
  value = join(",", var.public_albs)
}
