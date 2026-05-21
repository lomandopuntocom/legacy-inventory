resource "aws_security_group" "app_sg" {
  name        = "legacy-inventory-sg"
  description = "Permitir trafico al puerto de la aplicacion"

  ingress {
    from_port   = var.app_port
    to_port     = var.app_port
    protocol    = "tcp"
    cidr_blocks = ["190.104.20.154/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}