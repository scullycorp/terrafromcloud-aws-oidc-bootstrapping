resource tfe_workspace "project_manager_workspace" {
  name         = "AWS_OIDC_Bootstrap_Workspace"
  organization = var.terraform_organization
  project_id   = var.terraform_project
  description = "Configures AWS bootstrap configuration details"
  working_directory = "/terraform/bootstrap/2_aws"
  vcs_repo {
    identifier     = "scullycorp/terrafromcloud-aws-oidc-bootstrapping"
    branch         = "main"
    oauth_token_id = var.terraform_oauth_token_id
  }
}