variable "efs_file_system_id" {
  description = "The ID of the EFS file system to be used with MongoDB"
}

variable "private_subnet_id" {
  description = "The ID of the private subnet"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group for the ECS service"
  type        = string
}
