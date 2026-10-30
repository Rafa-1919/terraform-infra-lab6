terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Imagen requerida para el servidor
resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = false
}

# Recurso solicitado en el laboratorio
resource "docker_container" "servidor_lab" {
  name  = var.container_name
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = var.puerto_externo
  }
}
