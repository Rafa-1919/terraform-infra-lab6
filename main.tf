terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = false
}

resource "docker_container" "servidor_lab" {
  name         = var.container_name
  image        = docker_image.nginx.image_id
  network_mode = "bridge"
  ports {
    internal = 80
    external = var.puerto_externo
  }
}
