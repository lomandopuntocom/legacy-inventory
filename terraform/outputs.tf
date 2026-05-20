output "instance_public_ip" {
  description = "IP Publica de la instancia EC2"
  value       = module.compute.public_ip
}