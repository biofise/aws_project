resource "aws_efs_file_system" "efs_mongodb" {
  creation_token = "efs-mongodb"

  tags = {
    Name = "EFS MongoDB"
  }
}

resource "aws_efs_mount_target" "efs_mount_target" {
  for_each           = var.subnet_ids
  file_system_id     = aws_efs_file_system.efs_mongodb.id
  subnet_id          = each.value
  security_groups    = [var.security_group_id]
}
