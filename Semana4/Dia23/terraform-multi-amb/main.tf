resource "aws_s3_bucket" "per_env" {
  for_each = local.environment_configs

  bucket = "${each.value.resource_prefix}-bucket"

  tags = {
    Environment = each.key
    Project     = var.app_name
  }

  force_destroy = true
}
