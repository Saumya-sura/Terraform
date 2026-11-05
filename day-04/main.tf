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

variable "environment" {
  type    = string
  default = "dev"
}

locals {
  project_label = "${var.app_name}-${var.environment}"
}

resource "local_file" "profile" {
  filename = "${path.module}/profile.txt"

  content = <<-EOT
    Application: ${var.app_name}
    Environment: ${var.environment}
    Project: ${local.project_label}
  EOT

  lifecycle {
    prevent_destroy = true
  }
}

resource "local_file" "manifest" {
  filename = "${path.module}/manifest.txt"

  content = <<-EOT
    Project: ${local.project_label}
    Profile file: ${local_file.profile.filename}
  EOT
}

resource "local_file" "audit" {
  filename = "${path.module}/audit.txt"
  content  = "Audit record for ${local.project_label}"

  depends_on = [local_file.profile]
}
