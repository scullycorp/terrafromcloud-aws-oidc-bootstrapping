# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_iam_openid_connect_provider" "terraform_cloud" {
  client_id_list  = ["aws.workload.identity"]
  tags            = {}
  tags_all        = {}
  thumbprint_list = [data.tls_certificate.terraform_cloud.certificates[0].sha1_fingerprint]
  url             = local.terraform_url
}

data tls_certificate "terraform_cloud" {
  url = local.terraform_url
}

output oid {
  value = aws_iam_openid_connect_provider.terraform_cloud.arn
}