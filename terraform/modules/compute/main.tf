resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.iam_instance_profile

  user_data = <<-EOF
              #!/bin/bash
              # Amazon Linux 2023 usa yum como gestor de paquetes
              yum update -y
              yum install -y nodejs git

              cd /home/ec2-user
              
              # Reemplaza TU_USUARIO_GITHUB con tu usuario real
              git clone https://github.com/lomandopuntocom/legacy-inventory.git
              cd legacy-inventory
              
              npm install
              
              export PORT=${var.app_port}
              nohup npm start > app.log 2>&1 &
              EOF

  tags = {
    Name = "LegacyInventory-Server"
  }
}