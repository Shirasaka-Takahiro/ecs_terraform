##IAM Role
resource "aws_iam_role" "fargate_task_execution" {
  name               = "role-fargate_task_execution"
  assume_role_policy = file("./ecs/fargate_task_assume_role.json")
}
 
##IAM Role Policy
resource "aws_iam_role_policy" "fargate_task_execution" {
  name   = "execution-policy"
  role   = aws_iam_role.fargate_task_execution.name
  policy = file("./ecs/fargate_task_execution_policy.json")
}