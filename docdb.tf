resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "${var.env}-docdb"
  engine                  = var.engine
  master_username         = data.aws_ssm_parameter.username.value
  master_password         = data.aws_ssm_parameter.password.value
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  skip_final_snapshot     = var.skip_final_snapshot
}
