resource "aws_ecr_repository" "web01" {
  name = var.repository_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

##Build up Dockerfile  
resource "null_resource" "web01" {
  provisioner "local-exec" {
    command = "$(aws ecr get-login --no-include-email --region ${var.regions})"
  }

  #provisioner "local-exec" {
  #  command = "docker build -t ${var.image_name} ${var.docker_dir}"
  #}

  provisioner "local-exec" {
    command = "docker tag ${var.image_name}:latest ${aws_ecr_repository.web01.repository_url}"
  }

  provisioner "local-exec" {
    command = "docker push ${aws_ecr_repository.web01.repository_url}"
  }
}