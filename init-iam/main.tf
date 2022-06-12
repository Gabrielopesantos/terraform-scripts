module "iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "5.1.0"

  name = "gabriel"

  create_iam_user_login_profile = true
  create_iam_access_key         = true
}

module "devs_group" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "5.1.0"
  name    = "devs"

  group_users = [
    module.iam_user.iam_user_name,
  ]

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/PowerUserAccess",
    "arn:aws:iam::aws:policy/IAMUserSSHKeys",
    "arn:aws:iam::aws:policy/IAMUserChangePassword",
    "arn:aws:iam::aws:policy/IAMSelfManageServiceSpecificCredentials",
  ]
}
