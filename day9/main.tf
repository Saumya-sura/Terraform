terraform {
  required_version = ">= 1.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

variable "environment" {
  type    = string
  default = "development"
}

resource "local_file" "app_config" {
  filename = "${path.module}/app-config.txt"

  content = <<-EOT
    Application: Daily Ease
    Environment: ${var.environment}
    Managed by: Terraform
  EOT
}

output "environment" {
  value = var.environment
}
