variable "subnet_ids" {
  description = "Sous-reseau au doit etre le point de montage"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID to associate with the EFS mount targets"
  type        = string
}
