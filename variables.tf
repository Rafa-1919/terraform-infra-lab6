variable "container_name" {
  description = "Nombre del contenedor de infraestructura"
  type        = string
  default     = "servidor-lab"
}

variable "puerto_externo" {
  description = "Puerto expuesto en el host"
  type        = number
  default     = 8082
}
