output "load_balancer_arn" {
  value = aws_lb.load_balancer.arn
}
output "load_balancer_name" {
  value = aws_lb.load_balancer.name
}

output "load_balancer_id" {
  value = aws_lb.load_balancer.id
}

output "load_balancer_dns_name" {
  value = aws_lb.load_balancer.dns_name
}

output "http_listener_arn" {
  value = one(aws_lb_listener.http_listener[*].arn)
}
