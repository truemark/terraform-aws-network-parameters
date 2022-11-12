output "vpc_parameter_name" {
  value = aws_ssm_parameter.vpc.name
}

output "vpc_parameter_id" {
  value = aws_ssm_parameter.vpc.id
}

output "vpc_parameter_arn" {
  value = aws_ssm_parameter.vpc.arn
}

output "az_parameter_names" {
  value = aws_ssm_parameter.azs.*.name
}

output "az_parameter_ids" {
  value = aws_ssm_parameter.azs.*.id
}

output "az_parameter_arns" {
  value = aws_ssm_parameter.azs.*.arn
}

output "public_subnet_parameter_names" {
  value = aws_ssm_parameter.public_subnets.*.name
}

output "public_subnet_parameter_ids" {
  value = aws_ssm_parameter.public_subnets.*.id
}

output "public_subnet_parameter_arns" {
  value = aws_ssm_parameter.public_subnets.*.arn
}

output "private_subnet_parameter_names" {
  value = aws_ssm_parameter.private_subnets.*.name
}

output "private_subnet_parameter_ids" {
  value = aws_ssm_parameter.private_subnets.*.id
}

output "private_subnet_parameter_arns" {
  value = aws_ssm_parameter.private_subnets.*.arn
}

output "private_alb_parameter_names" {
  value = aws_ssm_parameter.private_albs.*.name
}

output "private_alb_parameter_ids" {
  value = aws_ssm_parameter.private_albs.*.id
}

output "private_alb_parameter_arns" {
  value = aws_ssm_parameter.private_albs.*.arn
}

output "public_alb_parameter_names" {
  value = aws_ssm_parameter.public_albs.*.name
}

output "public_alb_parameter_ids" {
  value = aws_ssm_parameter.public_albs.*.id
}

output "public_alb_parameter_arns" {
  value = aws_ssm_parameter.public_albs.*.arn
}

