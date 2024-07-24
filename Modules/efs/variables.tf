variable "subnet_ids" {
  description = "List of subnet IDs where EFS mount targets will be created"
  type        = map(string)
}

variable "security_group_id" {
  description = "Security group ID to associate with the EFS mount targets"
  type        = string
}
