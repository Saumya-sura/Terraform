terraform {
  required_version = ">= 1.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

variable "app_name" {
  type    = string
  default = "daily-ease"
}

resource "local_file" "app_config" {
  filename = "${path.module}/app-config.txt"

  content = <<-EOT
    Application: ${var.app_name}
    Environment: development
    Managed by: Terraform
  EOT
}

output "config_file_path" {
  value = local_file.app_config.filename
}

