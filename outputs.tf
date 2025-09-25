output "container_id" {
  description = "ID of the created docker container"
  value       = docker_container.app_container.id
}

output "app_url" {
  description = "URL to access the Flask app on the host"
  value       = "http://localhost:${var.host_port}"
}

