output "efs_id" {
  value = aws_efs_file_system.efs_mariadb.id
}

output "efs_arn" {
  value = aws_efs_file_system.efs_mariadb.arn
}
