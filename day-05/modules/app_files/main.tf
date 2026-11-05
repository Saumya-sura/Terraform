terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

locals {
  project_label = "${var.app_name}-${var.environment}"
}

resource "local_file" "profile" {
  filename = "${path.module}/profile.txt"

  content = <<-EOT
    Application: ${var.app_name}
    Environment: ${var.environment}
    Owner: ${var.owner}
    Project: ${local.project_label}
  EOT
}

resource "local_file" "manifest" {
  filename = "${path.module}/manifest.txt"

  content = <<-EOT
    Project: ${local.project_label}
    Profile: ${local_file.profile.filename}
  EOT
}
