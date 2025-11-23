
data "tfe_oauth_client" "client" {
  organization     = var.terraform_organization
  service_provider = "github"
}