
resource "tfe_project" "aws_search_project" {
  name         = var.terraform_project
  organization = var.terraform_organization
  description  = "Project to hold resources for AWS OIDC and Terraform 1.14 query test."
}

resource "tfe_team_project_access" "aws_search_project_access" {
  project_id = tfe_project.aws_search_project.id
  team_id    = tfe_team.project_management.id
  access     = "maintain"
}

resource "tfe_variable_set" "project_variable_configuration" {
  name              = "AWS Terraform Search Repo Project Configuration"
  description       = "Holds configuration variables for AWS Terraform Search Repo project"
  organization      = var.terraform_organization
  parent_project_id = tfe_project.aws_search_project.id
}


resource "tfe_variable" "project_variable_configuration_terraform_organization" {

  key             = "terraform_organization"
  value           = var.terraform_organization
  category        = "terraform"
  variable_set_id = tfe_variable_set.project_variable_configuration.id
  description     = "Terraform Cloud organization name"
}
resource "tfe_variable" "project_variable_configuration_terraform_project" {

  key             = "terraform_project"
  value           = var.terraform_project
  category        = "terraform"
  variable_set_id = tfe_variable_set.project_variable_configuration.id
  description     = "Terraform Cloud project name"
}

resource "tfe_variable" "project_variable_configuration_aws_account_id" {

  key             = "aws_account_id"
  value           = var.aws_account_id
  category        = "terraform"
  variable_set_id = tfe_variable_set.project_variable_configuration.id
  description     = "AWS Account ID for Workload Identity Federation"
}

resource "tfe_project_variable_set" "project_scope_output_reading_assignment" {
  project_id      = tfe_project.aws_search_project.id
  variable_set_id = tfe_variable_set.project_variable_configuration.id
}
