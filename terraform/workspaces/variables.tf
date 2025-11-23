variable terraform_organization {
  type = string
  description = "(PROJECT VARSET MANAGED) The Terraform Cloud organization name to use for the IAM OIDC provider subject claims."
  validation {
    condition    =  !(strcontains(var.terraform_organization, "*"))
    error_message = "The terraform_organization variable must not contain wildcard characters."
  }
}

variable terraform_project {
  type = string
  description = "(PROJECT VARSET MANAGED) The Terraform Cloud project name."
  validation {
    condition    =  length(var.terraform_project) >= 3 && length(var.terraform_project) <= 40 && !(strcontains(var.terraform_organization, "*"))
    error_message = "The terraform_project value must be between 3 and 40 characters in length."
  }
}


variable terraform_project_id {
  type = string
  description = "(PROJECT VARSET MANAGED) The Terraform Cloud project ID to use for workspace management."
}


variable "terraform_oauth_token_id" {
  type        = string
  description = "(PROJECT VARSET MANAGED) The Terraform Cloud OAuth token ID for connecting workspaces to GitHub."
}