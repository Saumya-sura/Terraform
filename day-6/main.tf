terraform {
  required_version = ">= 1.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

locals {
  environment = terraform.workspace
}

resource "local_file" "environment_config" {
  filename = "${path.module}/${local.environment}-config.txt"

  content = <<-EOT
    Application: Daily Ease
    Environment: ${local.environment}
    Managed by: Terraform
  EOT
}

output "current_workspace" {
  description = "Currently selected Terraform workspace"
  value       = terraform.workspace
}

output "generated_file" {
  description = "Path of the generated environment file"
  value       = local_file.environment_config.filename
}
