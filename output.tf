output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.k8s_vpc.id
}

output "public_subnets" {
  description = "Public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "private_subnets" {
  description = "Private subnet IDs"
  value       = aws_subnet.private[*].id
}

output "load_balancer_public_ip" {
  description = "Load balancer public IP"
  value       = aws_instance.load_balancer.public_ip
}

output "load_balancer_private_ip" {
  description = "Load balancer private IP"
  value       = aws_instance.load_balancer.private_ip
}

output "master_private_ips" {
  description = "Master node private IPs"
  value       = aws_instance.master[*].private_ip
}

output "worker_private_ips" {
  description = "Worker node private IPs"
  value       = aws_instance.worker[*].private_ip
}
