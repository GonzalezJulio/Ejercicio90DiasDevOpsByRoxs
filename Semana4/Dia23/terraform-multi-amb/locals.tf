locals {
  cost_per_instance = {
    "t3.micro"  = 5
    "t3.small"  = 10
    "t3.medium" = 20
  }
  environment_configs = {
    for env, config in var.environments :
    env => merge(config, {
      resource_prefix = "${var.app_name}-${env}"
      storage_size    = env == "prod" ? 50 : env == "staging" ? 20 : 8
      monthly_cost    = lookup(local.cost_per_instance, config.instance_type, 0)
      cdn_enabled     = env == "prod" ? true : false
      waf_enabled     = env == "prod" ? true : false


    })
  }
}
