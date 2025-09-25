variable "docker_host" {
  description = "Docker daemon host. For Windows use npipe:////./pipe/docker_engine"
  type        = string
  default     = "unix:///var/run/docker.sock"
}

variable "image_name" {
  description = "Name of the built Docker image"
  type        = string
  default     = "terraform-flask-app"
}

variable "image_tag" {
  description = "Image tag"
  type        = string
  default     = "v1.0.0"
}

variable "container_name" {
  description = "Name of the Docker container"
  type        = string
  default     = "terraform-flask-container"
}

variable "host_port" {
  description = "Host port to map to container's 5000"
  type        = number
  default     = 8080
}

