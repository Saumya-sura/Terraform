output "project_label" {
  description = "Project label returned by the child module"
  value       = module.app_files.project_label
}

output "profile_path" {
  description = "Generated profile path"
  value       = module.app_files.profile_path
}

output "manifest_path" {
  description = "Generated manifest path"
  value       = module.app_files.manifest_path
}
