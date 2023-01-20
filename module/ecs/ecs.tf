##Cluster
resource "aws_ecs_cluster" "cluster" {
  name = "${var.general_config["project"]}-${var.general_config[env]}-cluster-fargate-web01"
 
  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}
 
##Task Definition
resource "aws_ecs_task_definition" "task" {
  family                = "${var.general_config["project"]-var.general_config["env"]}-task-fargate-web01"
  container_definitions = file("container_definitions.json", { ecr_repository_url = var.ecr_repository_url })
  cpu                   = "256"
  memory                = "512"
  network_mode          = "awsvpc"
  execution_role_arn    = aws_iam_role.fargate_task_execution.arn
 
  requires_compatibilities = [
    "FARGATE"
  ]
}
 
##Service
resource "aws_ecs_service" "service" {
  name             = "service-fargate-web01"
  cluster          = aws_ecs_cluster.cluster.arn
  task_definition  = aws_ecs_task_definition.task.arn
  desired_count    = 2
  launch_type      = "FARGATE"
  platform_version = "1.4.0"
 
  load_balancer {
    target_group_arn = aws_lb_target_group.alb.arn
    container_name   = "${var.general_config["project"]}-${var.general_config["env"]}-web01"
    container_port   = "80"
  }
 
  network_configuration {
    subnets = var.public_subnets
    security_groups = [
      aws_security_group.common.id
    ]
    assign_public_ip = false
  }
}