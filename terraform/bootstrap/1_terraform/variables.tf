variable "terraform_organization" {
  type        = string
  description = "The Terraform Cloud organization name to use for the IAM OIDC provider subject claims."
  validation {
    condition     = !(strcontains(var.terraform_organization, "*"))
    error_message = "The terraform_organization variable must not contain wildcard characters."
  }
}

variable "terraform_project" {
  type        = string
  description = "The Terraform Cloud organization name to use for the IAM OIDC provider subject claims."
  default     = "tf_1_14_query_demo"
  validation {
    condition     = length(var.terraform_project) >= 3 && length(var.terraform_project) <= 40 && !(strcontains(var.terraform_organization, "*"))
    error_message = "The terraform_project value must be between 3 and 40 characters in length."
  }
}

# variable aws_account_id {
#   type = string
#   description = "The AWS Account ID where the IAM Role for Terraform Cloud Workload Identity Federation will be created."
# }

data "tfe_oauth_client" "client" {
  organization     = var.terraform_organization
  service_provider = "github"
}