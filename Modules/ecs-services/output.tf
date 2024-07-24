output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.mongodb_task.arn
}

variable "ecs_cluster_id" {
  description = "The ID of the ECS cluster where the service will be deployed"
  type        = string
}
