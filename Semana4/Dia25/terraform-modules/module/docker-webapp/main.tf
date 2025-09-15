terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}


resource "docker_image" "webapp" {
  name = var.image_name
}

resource "docker_container" "webapp" {
        name = var.container_name
        image = docker_image.webapp.name
        networks_advanced {
          name = docker_network.webapp_net.name
        }
        ports {
                  internal = var.container_port
                  external = var.host_port
        }
        mounts {
          target = var.mount_path
          source = docker_volume.webapp_volume.name
          type   = "volume"
        }

}

resource "docker_network" "webapp_net" {
  name = "${var.container_name}-net"
}

resource "docker_volume" "webapp_volume" {
  name = var.volume_name
}