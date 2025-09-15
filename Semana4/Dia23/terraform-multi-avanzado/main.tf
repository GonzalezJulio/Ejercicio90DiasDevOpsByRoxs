provider "aws" {
  region = var.region
}

locals {
  configuration_validation = {
    for env, config in local.env_config : env => {
      # 1. VPC CIDR debe empezar con 10. si es prod
      prod_cidr_ok = env != "prod" ? true : startswith(config.cidr_block, "10.")

      # 2. Nombre VPC y nombre de subnet deben ser diferentes
      name_unique = config.vpc_name != "subnet-${env}"

      # 3. CIDR debe tener una máscara /16
      cidr_mask_valid = split("/", config.cidr_block)[1] == "16"
    }
  }

  # Validaciones generales por entorno
  all_validations_passed = {
    for env, checks in local.configuration_validation :
    env => alltrue(values(checks))
  }
}

resource "aws_vpc" "per_env" {
  for_each   = local.env_config
  cidr_block = each.value.cidr_block

  tags = {
    Name = each.value.vpc_name
  }
}

resource "aws_subnet" "per_env" {
  for_each = local.env_config

  vpc_id            = aws_vpc.per_env[each.key].id
  cidr_block        = cidrsubnet(each.value.cidr_block, 8, 0)
  availability_zone = "${var.region}a"

  tags = {
    Name = "subnet-${each.key}"
  }
}

resource "local_file" "validation_report" {
  for_each = local.configuration_validation

  filename = "validation-report-${each.key}.txt"
  content  = <<-EOT
    VALIDATION REPORT for ${each.key}
    ================================

    CIDR block: ${local.env_config[each.key].cidr_block}
    VPC name: ${local.env_config[each.key].vpc_name}

    Validations:
    %{for check, result in each.value~}
    ${result ? "✅" : "❌"} ${check}
    %{endfor~}

    Overall: ${local.all_validations_passed[each.key] ? "✅ PASSED" : "❌ FAILED"}

    %{if !local.all_validations_passed[each.key]~}
    ⚠️ Please review and fix the failed validations before deployment.
    %{endif~}
  EOT
}
