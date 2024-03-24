output "ec2_public_IP" {
  value = aws_instance.elasticsearch.public_ip
}