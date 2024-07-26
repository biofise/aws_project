variable "region" {
  description = "Region du déploiement"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "Bloc CIDR du VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Bloc CIDR du sous-reseau public"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Bloc CIDR du sous-reseaux prive"
  type        = string
  default     = "10.0.2.0/24"
}

variable "mysql_root_password" {
  description = "Mot de passe root pour MariaDB"
  type        = string
}

variable "mysql_database" {
  description = "Nom de la base de donnees"
  default     = "dbtest"
}

variable "execution_role_arn" {
  description = "ARN role IAM"
  default     = "arn:aws:iam::842393425042:role/LabRole"
}
