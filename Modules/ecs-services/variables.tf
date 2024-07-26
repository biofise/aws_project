variable "efs_file_system_id" {
  description = "ID du montage EFS pour mariaDB"
}

variable "private_subnet_id" {
  description = "ID du sous-reseaux"
  type        = string
}

variable "security_group_id" {
  description = "ID du groupe de securite pour ECS"
  type        = string
}

variable "mysql_root_password" {
  description = "Mots de passe root MariaDB"
}

variable "mysql_database" {
  description = "Nom de la base de donnee"
}

variable "execution_role_arn" {
  description = "Nom du role"
}
