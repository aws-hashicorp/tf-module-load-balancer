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

output "vpc_link_id" {
  value = one(aws_apigatewayv2_vpc_link.api_gateway_vpc_link[*].id)
}

output "vpc_link_arn" {
  value = one(aws_apigatewayv2_vpc_link.api_gateway_vpc_link[*].arn)
}

output "vpc_link_rest_id" {
  value = aws_api_gateway_vpc_link.api_gateway_rest_vpc_link[0].id
}

output "vpc_link_rest_arn" {
  value = aws_api_gateway_vpc_link.api_gateway_rest_vpc_link[0].arn
}
