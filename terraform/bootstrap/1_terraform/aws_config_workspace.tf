resource tfe_workspace "aws_oidc_bootstrap_workspace" {
  name         = "AWS_OIDC_Bootstrap_Workspace"
  organization = var.terraform_organization
  project_id   = tfe_project.aws_search_project.id
  description = "Configures AWS bootstrap configuration details"
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

