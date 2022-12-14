output "workspace_name" {
  value       = "feature-${local.workspace_name}"
  description = "The name of the terraform workspace for the branch ephemeral environment without service prefix"
}
