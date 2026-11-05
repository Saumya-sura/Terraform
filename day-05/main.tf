terraform {
  required_version = ">= 1.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

module "app_files" {
  source = "./modules/app_files"

  app_name    = var.app_name
  environment = var.environment
  owner       = var.owner
}

