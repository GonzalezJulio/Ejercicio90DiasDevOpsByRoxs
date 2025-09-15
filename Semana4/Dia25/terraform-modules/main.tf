terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {

}

module "webapp" {
  source         = "./module/docker-webapp"
  image_name     = "nginx:latest"
  container_name = "nginx-test"
  host_port      = 8080
  container_port = 80
  network_name = "webapp-network"

  volume_name = "nginx-data"
  mount_path  = "/usr/share/nginx/html"
}

