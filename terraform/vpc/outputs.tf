output "vpc_id" {
  value = aws_vpc.elasticsearch_vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnets[0].id
}

output "environment" {
  value = var.environment
}