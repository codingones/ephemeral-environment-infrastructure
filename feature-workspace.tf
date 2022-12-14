data "http" "feature_workspace" {
  url = "https://app.terraform.io/api/v2/organizations/${var.product}/workspaces/${var.service}-feature-${local.workspace_name}"
  request_headers = {
    Authorization = "Bearer ${var.tf_api_token}"
    Content-Type  = "application/vnd.api+json"
  }
}

locals {
  feature_type   = split("/", var.branch)[0]
  workspace_name = split("/", var.branch)[1]
  already_exist  = lookup(jsondecode(data.http.feature_workspace.response_body), "errors", false) == false
}

resource "tfe_workspace" "ephemeral_environment" {
  count        = local.already_exist ? 0 : 1
  name         = "${var.service}-feature-${local.workspace_name}"
  organization = var.product
  description  = "Ephemeral environment for ${var.product} ${var.service} synchronized with `${var.branch}` branch"
  tag_names    = ["ephemeral-environment", var.service, local.feature_type]
}

resource "tfe_variable" "aws_access_key_id" {
  count        = local.already_exist ? 0 : 1
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.aws_access_key_id
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.ephemeral_environment[0].id
  description  = "This access key id is associated with an AWS IAM user allowed to run deployments for ${var.product} ${var.service}"
}

resource "tfe_variable" "aws_secret_access_key" {
  count        = local.already_exist ? 0 : 1
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.aws_secret_access_key
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.ephemeral_environment[0].id
  description  = "This secret access key is associated with an AWS IAM user allowed to run deployments for ${var.product} ${var.service}"
}
