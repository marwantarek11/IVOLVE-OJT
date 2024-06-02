output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "ec2_instance_id" {
  value = aws_instance.web.id
}

output "db_instance_endpoints" {
  value = aws_db_instance.db[*].endpoint
}

