variable "aws_region" {
  default = "us-east-1"
}

variable "app_port" {
  default = 5000
}

variable "instance_type" {
  default = "t2.micro"
}

variable "iam_instance_profile" {
  description = "Reemplazar con el nombre exacto de tu rol de Learner Lab"
  default     = "LabInstanceProfile" # <-- REVISA EN AWS SI ESTE ES EL NOMBRE CORRECTO
}