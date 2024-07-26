resource "aws_ecs_task_definition" "mariadb_task" {
  family                   = "mariadb"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = var.execution_role_arn  

  container_definitions = jsonencode([
    {
      name      = "ma-mariadb"
      image     = "842393425042.dkr.ecr.us-east-1.amazonaws.com/ma-mariadb:latest"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 3306
          hostPort      = 3306
        }
      ]

      environment = [
      {
        name  = "MYSQL_ROOT_PASSWORD"
        value = var.mysql_root_password
      },
      {
        name  = "MYSQL_DATABASE"
        value = var.mysql_database
      }
     ]
      mountPoints = [
        {
          sourceVolume  = "mariadb_data"
          containerPath = "/var/lib/mysql/"
          readOnly      = false
        }
      ]
    }
  ])

  volume {
    name = "mariadb_data"
    efs_volume_configuration {
      file_system_id = var.efs_file_system_id
      root_directory = "/"
      transit_encryption = "ENABLED"
    }
  }
}

resource "aws_ecs_service" "mariadb_service" {
  name            = "mariadb-service"
  cluster         = var.ecs_cluster_id
  task_definition = aws_ecs_task_definition.mariadb_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = [var.private_subnet_id]
    security_groups  = [var.security_group_id]
#    assign_public_ip = true
  }
  depends_on = [
    aws_ecs_task_definition.mariadb_task
  ]
}
