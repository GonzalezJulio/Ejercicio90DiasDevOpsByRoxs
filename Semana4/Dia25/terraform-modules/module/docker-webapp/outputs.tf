output "container_id" {
         value = docker_container.webapp.id
}

output "docker_image" {
         value =  docker_image.webapp.name
}