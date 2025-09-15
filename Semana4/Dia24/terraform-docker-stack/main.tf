terraform {
  required_providers {
    docker = {
      source  = "calxus/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Red de Docker
resource "docker_network" "app_network" {
  name = "app_network"
}

# Imagen de PostgreSQL
resource "docker_image" "postgres" {
  name         = "postgres:15"
  keep_locally = false
}

# Contenedor de PostgreSQL
resource "docker_container" "postgres" {
  name  = "postgres"
  image = docker_image.postgres.name

  env = [
    "POSTGRES_USER=admin",
    "POSTGRES_PASSWORD=admin123",
    "POSTGRES_DB=app_db"
  ]

  ports {
    internal = 5432
    external = 5433
  }

  networks_advanced {
    name = docker_network.app_network.name
  }
}

# Imagen de Redis
resource "docker_image" "redis" {
  name         = "redis:7"
  keep_locally = false
}

# Contenedor de Redis
resource "docker_container" "redis" {
  name  = "redis"
  image = docker_image.redis.name

  ports {
    internal = 6379
    external = 6380
  }

  networks_advanced {
    name = docker_network.app_network.name
  }
}

# Imagen de Nginx
resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = false
}

# Contenedor de Nginx
resource "docker_container" "nginx" {
  name  = "nginx"
  image = docker_image.nginx.name

  ports {
    internal = 80
    external = 8080
  }

  networks_advanced {
    name = docker_network.app_network.name
  }

  volumes {
    host_path      = abspath("${path.module}/nginx.conf")
    container_path = "/etc/nginx/nginx.conf"
  }

}
