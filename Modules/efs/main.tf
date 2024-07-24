resource "aws_efs_file_system" "efs_mariadb" {
  creation_token   = "efs-mariadb"
  performance_mode = "generalPurpose"
  encrypted = true

  tags = {
    Name = "mariadb-data"
  }
}

resource "aws_efs_mount_target" "efs_mount_target" {
#  for_each           = toset(var.subnet_ids)
  file_system_id     = aws_efs_file_system.efs_mariadb.id
  subnet_id          = var.subnet_ids
  security_groups    = [var.security_group_id]
}
