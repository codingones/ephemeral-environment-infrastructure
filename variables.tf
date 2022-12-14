variable "tf_api_token" {
  sensitive   = true
  type        = string
  nullable    = false
  description = "The Terraform API token used to read workspace through Terraform Cloud API"
}

variable "aws_access_key_id" {
  sensitive   = true
  type        = string
  nullable    = false
  description = "The IAM AWS access key id for the deployer service account"
}

variable "aws_secret_access_key" {
  sensitive   = true
  type        = string
  nullable    = false
  description = "The IAM AWS secret access key for the deployer service account"
}

variable "product" {
  type        = string
  nullable    = false
  description = "The name of the product that hosts the ephemeral environment"
}

variable "service" {
  type        = string
  nullable    = false
  description = "The name of the service that will be run on the ephemeral environment"
}

variable "branch" {
  type        = string
  nullable    = false
  description = "The name of the branch that triggers the ephemeral environment deployment"
  validation {
    condition     = length(split("/", var.branch)) > 1
    error_message = "The branch name must start with a conventional prefix followed by / and the actual name of the branch ex: `feat/add-invoice-validation`"
  }
}
