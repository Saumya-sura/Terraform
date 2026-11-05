variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "daily-ease"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "Person responsible for the application"
  type        = string
  default     = "Saumya"
}
