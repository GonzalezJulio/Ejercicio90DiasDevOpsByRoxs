locals {
  global_config = {
    app_name    = "roxs-voting-app"
    environment = "dev"
    tags = {
      managed_by = "terraform"
      owner      = "julio"
    }
  }

  services_config = {
    vote = {
      language    = "python"
      memory_mb   = 256
      port        = 5000
      health_path = "/healthz"
      env_vars = {
        REDIS_HOST = "redis"
        DB_HOST    = "db"
      }
    }

    result = {
      language    = "node"
      memory_mb   = 128
      port        = 5001
      health_path = "/status"
      env_vars = {
        API_KEY = "secret"
      }
    }
  }

  # Transforma cada servicio en una entrada para usar en templatefile
  service_configs = {
    for name, svc in local.services_config : name => {
      name        = name
      language    = svc.language
      memory_mb   = svc.memory_mb
      port        = svc.port
      health_path = svc.health_path
      env_vars    = svc.env_vars
      app_name    = local.global_config.app_name
      environment = local.global_config.environment
      tags        = local.global_config.tags
    }
  }
}
