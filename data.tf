data "aws_ssm_parameter" "username" {
  name = "param.${var.env}.docdb.USERNAME"
}

data "aws_ssm_parameter" "password" {
  name = "param.${var.env}.docdb.PASSWORD"
}


