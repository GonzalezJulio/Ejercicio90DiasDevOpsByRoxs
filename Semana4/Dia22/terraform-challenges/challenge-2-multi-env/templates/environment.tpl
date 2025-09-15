# Generated for environment: ${env_name}

provider "aws" {
  region = "${config.region}"
}

resource "aws_instance" "${env_name}_instance" {
  ami           = "ami-12345678"
  instance_type = "${config.instance_type}"
  count         = ${config.instance_count}
  tags = {
    Environment = "${env_name}"
  }
}

resource "aws_db_instance" "${env_name}_db" {
  allocated_storage    = "${config.database_size == "small" ? 20 : config.database_size == "medium" ? 50 : 100}"
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  name                 = "${env_name}_db"
  username             = "admin"
  password             = "terraform123"
  skip_final_snapshot  = true
  backup_retention_period = ${config.backup_enabled ? 7 : 0}
}
