resource "aws_docdb_subnet_group" "docdb" {
  name       = "${var.env}-docdb"
  subnet_ids = local.app_subnets_ids

  tags = {
    Name = "${var.env}-docdb"
  }
}

resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "${var.env}-docdb"
  engine                  = var.engine
  master_username         = data.aws_ssm_parameter.username.value
  master_password         = data.aws_ssm_parameter.password.value
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  skip_final_snapshot     = var.skip_final_snapshot
  kms_key_id              = var.kms_key_id
  vpc_security_group_ids  = [aws_security_group.allow_docdb.id]
  db_subnet_group_name    = aws_docdb_subnet_group.docdb.name
  storage_encrypted       = var.storage_encrypted
}

resource "aws_docdb_cluster_instance" "instances" {
  count              = var.instance_count
  identifier         = "${var.env}-docdb-${count.index}"
  cluster_identifier = aws_docdb_cluster.docdb.id
  instance_class     = var.instance_class
}


