variable terraform_organization {
  type = string
  description = "The Terraform Cloud organization name to use for the IAM OIDC provider subject claims."
  validation {
    condition    =  !(strcontains(var.terraform_organization, "*"))
    error_message = "The terraform_organization variable must not contain wildcard characters."
  }
}

variable terraform_project {
  type = string
  description = "The Terraform Cloud organization name to use for the IAM OIDC provider subject claims."
  validation {
    condition    =  length(var.terraform_project) >= 3 && length(var.terraform_project) <= 40 && !(strcontains(var.terraform_organization, "*"))
    error_message = "The terraform_project value must be between 3 and 40 characters in length."
  }
}