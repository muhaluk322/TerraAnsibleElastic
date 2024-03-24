output "ec2_public_ip" {
  value = module.ec2.ec2_public_IP
}

output "private_key" {
  value = module.ssh_key.private_key
  sensitive = true
}