output "container_id" {
  description = "ID del contenedor Docker desplegado"
  value       = docker_container.servidor_lab.id
}

output "url_servicio" {
  description = "URL local del servicio web"
  value       = "http://localhost:${var.puerto_externo}"
}
