resource "local_file" "service_configs" {
  for_each = local.service_configs

  filename = "${path.module}/rendered/${each.key}-service.yaml"

  content = templatefile("${path.module}/templates/service.tmpl", {
    name        = each.value.name
    language    = each.value.language
    memory_mb   = each.value.memory_mb
    port        = each.value.port
    health_path = each.value.health_path
    env_vars    = each.value.env_vars
    app_name    = each.value.app_name
    environment = each.value.environment
    tags        = each.value.tags
  })
}
