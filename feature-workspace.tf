locals {
  feature_type   = split("/", var.branch)[0]
  workspace_name = split("/", var.branch)[1]
}

data "tfe_workspace" "ephemeral_environment" {
  name         = "${var.service}-feature-${local.workspace_name}"
  organization = var.product
}

resource "tfe_workspace" "ephemeral_environment" {
  count        = "$(data.tfe_workspace.ephemeral_environment.count == 0 ? 1 : 0)"
  name         = "${var.service}-feature-${local.workspace_name}"
  organization = var.product
  description  = "Ephemeral environment for ${var.product} ${var.service} synchronized with `${var.branch}` branch"
  tag_names    = ["ephemeral-environment", var.service, local.feature_type]
}

resource "tfe_variable" "aws_access_key_id" {
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.aws_access_key_id
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.ephemeral_environment.id
  description  = "This access key id is associated with an AWS IAM user allowed to run deployments for ${var.product} ${var.service}"
}

resource "tfe_variable" "aws_secret_access_key" {
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.aws_secret_access_key
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.ephemeral_environment.id
  description  = "This secret access key is associated with an AWS IAM user allowed to run deployments for ${var.product} ${var.service}"
}
