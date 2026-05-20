data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

module "network" {
  source   = "./modules/network"
  app_port = var.app_port
}

module "compute" {
  source               = "./modules/compute"
  ami_id               = data.aws_ami.amazon_linux_2023.id
  instance_type        = var.instance_type
  security_group_id    = module.network.security_group_id
  iam_instance_profile = var.iam_instance_profile
  app_port             = var.app_port
}