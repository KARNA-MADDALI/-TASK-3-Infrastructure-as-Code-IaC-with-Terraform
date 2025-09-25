terraform {
  required_version = ">= 1.3.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.21.0"
    }
  }
}

provider "docker" {
  # Use this to override the Docker host if needed:
  # host = var.docker_host
  host = var.docker_host
}

resource "docker_image" "app_image" {
  name = "${var.image_name}:${var.image_tag}"

  build {
    path = "${path.module}/app"
  }
}

resource "docker_container" "app_container" {
  name  = var.container_name
  image = docker_image.app_image.image_id

  ports {
    internal = 5000
    external = var.host_port
  }

  env = [
    "FLASK_ENV=production",
    "APP_ENV=production"
  ]

  restart = "on-failure"
}
