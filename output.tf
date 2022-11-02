output "workspace_name" {
  value       = tfe_workspace.ephemeral_environment.name
  description = "The name of the terraform workspace for the branch ephemeral environment"
}
