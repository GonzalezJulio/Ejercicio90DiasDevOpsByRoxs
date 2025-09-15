
# Generar archivo por ambiente
resource "local_file" "environment_configs" {
  for_each = var.environments
  
  filename = "${path.module}/../solutions/challenge-2-multi-env/environments/${each.key}.tf"
  content = templatefile("${path.module}/templates/environment.tpl", {
    env_name = each.key
    config   = each.value
  })
}