output "project_label" {
  description = "Calculated application and environment name"
  value       = local.project_label
}

output "profile_path" {
  description = "Path to the generated profile"
  value       = local_file.profile.filename
}

output "manifest_path" {
  description = "Path to the generated manifest"
  value       = local_file.manifest.filename
}
