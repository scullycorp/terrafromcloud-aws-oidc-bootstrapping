resource tfe_team project_management {
    organization = var.terraform_organization
    name         = "tf_1_14_query_demo_Project_Management"
}

ephemeral tfe_team_token project_management_token {
    team_id      = tfe_team.project_management.id
}

