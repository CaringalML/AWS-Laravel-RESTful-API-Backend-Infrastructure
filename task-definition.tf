# Task Definition for Laravel Application
resource "aws_ecs_task_definition" "laravel_app" {
  family                   = "student-enrollment-laravel-api"
  requires_compatibilities = ["EC2", "FARGATE"]
  network_mode            = "awsvpc"
  cpu                     = var.container_cpu
  memory                  = var.container_memory
  execution_role_arn      = aws_iam_role.ecs_execution_role.arn
  task_role_arn           = aws_iam_role.ecs_task_role.arn

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture       = "X86_64"
  }

  container_definitions = jsonencode([
    {
      name         = "student-enrollment-laravel-api"
      image        = "${aws_ecr_repository.student_enrollment_api.repository_url}:latest"
      essential    = true

      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp"
        }
      ]

      environment = [
        {
          name  = "APP_ENV"
          value = var.environment
        },
        {
          name  = "APP_DEBUG"
          value = "false"
        },
        {
          name  = "DB_CONNECTION"
          value = var.db_connection
        },
        {
          name  = "DB_HOST"
          value = split(":", aws_db_instance.caringal.endpoint)[0]  # Remove port number from endpoint
        },
        {
          name  = "DB_PORT"
          value = tostring(var.db_port)
        },
        {
          name  = "DB_DATABASE"
          value = var.db_name
        },
        {
          name  = "DB_USERNAME"
          value = var.db_username
        },
        {
          name  = "DB_PASSWORD"
          value = var.db_password
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.laravel_app.name
          "awslogs-region"        = var.aws_region
          "awslogs-stream-prefix" = "ecs"
        }
      }

      mountPoints = []
      volumesFrom = []
    }
  ])

  tags = var.default_tags
}