terraform {
  required_version = ">=1.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}
resource "local_file" "first_file" {
  filename = "${path.module}/hello.txt"
  content  = " My First Terraform"
}
