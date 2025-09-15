variable "image_name" {
  description = "Nombre de la imagen Docker que se usará para el contenedor"
  type        = string
}

variable "container_name" {
  description = "Nombre del contenedor Docker"
  type        = string
}

variable "host_port" {
  description = "Puerto que se expondrá en el host"
  type        = number
  default     = 8080
}

variable "container_port" {
  description = "Puerto que escucha el contenedor"
  type        = number
  default     = 80
}

variable "volume_name" {
  type        = string
  description = "Nombre del volumen Docker persistente"
  default     = "webapp-volume"
}

variable "mount_path" {
  type        = string
  description = "Ruta del contenedor donde se montará el volumen"
  default     = "/usr/share/nginx/html"
}

variable "network_name" {
  type        = string
  description = "Nombre de la red Docker"
  default     = "webapp-network"
}

