resource "aws_ecs_task_definition" "mongodb_task" {
  family                   = "mongodb"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name      = "mongodb"
      image     = "mongo:latest"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 27017
          hostPort      = 27017
        }
      ]
      mountPoints = [
        {
          sourceVolume  = "mongodb_volume"
          containerPath = "/data/db"
          readOnly      = false
        }
      ]
    }
  ])

  volume {
    name = "mongodb_volume"
    efs_volume_configuration {
      file_system_id = var.efs_file_system_id
      root_directory = "/data/db"
      transit_encryption = "ENABLED"
    }
  }
}

resource "aws_ecs_service" "mongodb_service" {
  name            = "mongodb-service"
  cluster         = var.ecs_cluster_id
  task_definition = aws_ecs_task_definition.mongodb_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = [var.private_subnet_id]
    security_groups = [var.security_group_id]
    assign_public_ip = false
  }
}
