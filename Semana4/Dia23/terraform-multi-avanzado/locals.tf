locals {
  env_config = {
    dev = {
      cidr_block = "10.20.0.0/16"
      vpc_name   = "dev-vpc"
    }
    prod = {
      cidr_block = "10.0.0.0/16"
      vpc_name   = "subnet-prod" # <- esto también
    }
  }
}
