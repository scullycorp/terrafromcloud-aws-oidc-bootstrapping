
import {
  to = aws_iam_openid_connect_provider.terraform_cloud
  id = "arn:aws:iam::613208686742:oidc-provider/app.terraform.io"
}

import {
  to = aws_iam_role.terraform_cloud_search_role
  id = "terraformcloud_1_14_querysupport"
}