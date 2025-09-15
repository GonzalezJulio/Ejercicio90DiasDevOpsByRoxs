output "application_urls" {
  value = {
    nginx    = "http://localhost:8080"
    redis    = "redis://localhost:6379"
    postgres = "postgresql://admin:admin123@localhost:5432/app_db"
  }

  sensitive = true
}
