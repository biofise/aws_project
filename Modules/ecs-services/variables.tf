variable "efs_file_system_id" {
  description = "ID du montage EFS pour mariaDB"
}

variable "private_subnet_id" {
  description = "ID du sous-reseaux privee"
  type        = string
}

variable "security_group_id" {
  description = "ID du groupe de securite pour ECS"
  type        = string
}
