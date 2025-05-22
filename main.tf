# Load Balancer
resource "aws_lb" "load_balancer" {
  load_balancer_type               = var.load_balancer_type
  name                             = var.load_balancer_type == "application" ? "alb-${var.load_balancer_name}" : "nlb-${var.load_balancer_name}"
  internal                         = var.is_internal
  subnets                          = var.subnets
  security_groups                  = ["${var.sg_loadbalancer_id}"]
  enable_cross_zone_load_balancing = var.cross_zone

  tags = merge(var.tags, { Name = var.load_balancer_name })

  depends_on = [
    var.subnets, var.sg_loadbalancer_id
  ]
}

# HTTP Listener
resource "aws_lb_listener" "http_listener" {
  count             = var.create_default_listener == true ? 1 : 0
  load_balancer_arn = aws_lb.load_balancer.arn
  protocol          = var.listener_protocol
  port              = var.listener_port

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "application/json"
      message_body = "{message:Successfully, status: 200}"
      status_code  = "200"
    }
  }

  depends_on = [
    aws_lb.load_balancer
  ]
}
