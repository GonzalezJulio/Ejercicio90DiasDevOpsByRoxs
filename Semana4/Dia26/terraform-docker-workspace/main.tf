terraform {
  required_providers {
    docker = {
         source = "kreuzwerker/docker"
         version = "~> 3.0"
    }
  }
}

provider "docker" {}

locals {
         env_config = {
                  dev = {
                           replica_count = 1
                           memory_mb = 256
                           external_port = 8080
                           image_tag = "alpine"
                  }

                  staging = {
                           replica_count = 2
                           memory_mb = 512
                           external_port = 8081
                           image_tag = "1.25"
                  }
                  prod = {
                           replica_count = 3
                           memory_mb = 1024
                           external_port = 80
                           image_tag = "latest"
                  }
         }

         current_config = local.env_config[terraform.workspace]

         container_name = "${var.app_name}-${terraform.workspace}"
}

# Ngnix

resource "docker_image" "nginx" {
  name = "nginx:${local.current_config.image_tag}"
  keep_locally = false
}

#Red

resource "docker_network" "app_network" {
  name = "${local.container_name}-network"
}

#Contenedores

resource "docker_container" "app" {
  count = local.current_config.replica_count

  name = "${local.container_name}-${count.index + 1}"
  image = docker_image.nginx.image_id

  dynamic "ports" {
         for_each = count.index == 0 ? [1] : []
         content {
                  internal = 80
                  external = local.current_config.external_port

         }
    
  }

  env = [
         "ENVIRONMENT=${terraform.workspace}",
         "REPLICA_ID=${count.index + 1}",
         "TOTAL_REPLICAS=${local.current_config.replica_count}"
  ]

  memory = local.current_config.memory_mb

  networks_advanced {
    name = docker_network.app_network.name

  }

  labels {
         label = "environment"
         value = terraform.workspace
  }

  labels {
         label = "managed-by"
         value = "terraform"
  }
}
