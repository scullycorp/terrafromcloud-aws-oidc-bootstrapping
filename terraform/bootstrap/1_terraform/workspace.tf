resource tfe_workspace "project_manager_workspace" {
  name         = "${var.terraform_project}_ProjectManager"
  organization = var.terraform_organization
  project_id   = tfe_project.aws_search_project.id
  description = "Configures AWS bootstrap configuration details"
  working_directory = "/terraform/workspaces"
  vcs_repo {
    identifier     = "scullycorp/terrafromcloud-aws-oidc-bootstrapping"
    branch         = "main"
    oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
  }
}

resource "tfe_variable" "project_manager_tfe_token" {
  key = "TFE_TOKEN"
  value_wo = ephemeral.tfe_team_token.project_management_token.token
  category = "env"
  sensitive = true
  workspace_id = tfe_workspace.project_manager_workspace.id
  description = "TFE Token for managing resources for the TFC Project: ${var.terraform_project}"  
}

resource "tfe_variable" "project_manager_oauth_token_id" {

  key             = "terraform_oauth_token_id"
  value           = data.tfe_oauth_client.client.oauth_token_id
  category        = "terraform"
  sensitive = true
  workspace_id = tfe_workspace.project_manager_workspace.id
  description     = "OAuth Client Token ID for Terraform Cloud GitHub integration"
  
}

# resource "tfe_variable" "tfc_aws_provider_auth" {
#   key          = "TFC_AWS_PROVIDER_AUTH"
#   value        = "true"
#   category     = "env"
#   workspace_id = tfe_workspace.aws_oidc_bootstrap_workspace.id
#   description  = "Enable AWS Provider Workload Identity Federation Authentication"
# }


# resource "tfe_variable" "tfc_aws_run_role_arn" {
#   key          = "TFC_AWS_RUN_ROLE_ARN"
#   value        = "arn:aws:iam::${var.aws_account_id}:role/TFC_1.14_SearchTest"
#   category     = "env"
#   workspace_id = tfe_workspace.aws_oidc_bootstrap_workspace.id
#   description  = "Enable AWS Provider Workload Identity Federation Authentication"
# }

