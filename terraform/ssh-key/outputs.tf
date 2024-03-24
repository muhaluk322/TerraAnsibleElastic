output "private_key" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}

output "key_name" {
  value = var.key_name
}