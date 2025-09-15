output "vpc_ids" {
  value = { for env, vpc in aws_vpc.per_env : env => vpc.id }
}

output "subnet_ids" {
  value = { for env, subnet in aws_subnet.per_env : env => subnet.id }
}
