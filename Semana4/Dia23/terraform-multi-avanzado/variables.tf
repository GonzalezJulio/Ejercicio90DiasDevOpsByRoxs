variable "region" {
  default = "us-east-1"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "app_name" {
  type    = string
  default = "myapp"
}

variable "application_config" {
  type = object({
    name = string
    features = object({
      monitoring = bool
      backup     = bool
    })
    runtime = object({
      memory = number
      cpu    = number
    })
  })
}


