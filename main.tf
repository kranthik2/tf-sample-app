terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>2.20.0"
    }
  }
}
provider "docker" {}


resource "docker_image" "redis_image" {
  name = "redis:latest"
}

resource "random_string" "random" {
  count   = var.container_count
  length  = 4
  special = false
}

resource "docker_container" "redis_container" {
  count = var.container_count
  name  = join("-", ["redis", random_string.random[count.index].result])
  image = docker_image.redis_image.latest
  ports {
    internal = var.int_port
    external = var.ext_port
  }
}
