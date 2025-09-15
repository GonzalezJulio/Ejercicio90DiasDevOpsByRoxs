variable "workload_type" {
  description = "Tipo de carga de trabajo"
  type        = string
  validation {
    condition     = contains(["web", "api", "database", "cache", "queue"], var.workload_type)
    error_message = "Workload type must be valid."
  }
}
