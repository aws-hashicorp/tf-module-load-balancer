# Load Balancer
resource "aws_lb" "load_balancer" {
  load_balancer_type               = var.load_balancer_type
  name                             = var.load_balancer_type == "application" ? "alb-${var.load_balancer_name}" : "nlb-${var.load_balancer_name}"
  internal                         = var.is_internal
  subnets                          = var.subnets
  security_groups                  = [aws_security_group.sg_loadbalancer.id]
  enable_cross_zone_load_balancing = var.cross_zone

  tags = merge(
    var.tags,
    {
      Name = var.load_balancer_type == "application" ? "alb-${var.load_balancer_name}" : "nlb-${var.load_balancer_name}"
    }
  )

  depends_on = [
    var.subnets
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

# Security Group
resource "aws_security_group" "sg_loadbalancer" {
  name   = "${var.security_group_name}-sg"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.allowed_cidrs != null && length(var.allowed_cidrs) > 0 ? [1] : []
    content {
      from_port   = var.sg_listener_port_from
      to_port     = var.sg_listener_port_to
      protocol    = var.sg_listener_protocol
      cidr_blocks = var.allowed_cidrs
    }
  }

  dynamic "ingress" {
    for_each = var.allowed_security_groups != null && length(var.allowed_security_groups) > 0 ? [1] : []
    content {
      from_port       = var.sg_listener_port_from
      to_port         = var.sg_listener_port_to
      protocol        = var.sg_listener_protocol
      security_groups = var.allowed_security_groups
      description     = "Allow from security groups"
    }
  }

  dynamic "ingress" {
    for_each = var.allowed_prefix_list_ids != null && length(var.allowed_prefix_list_ids) > 0 ? [1] : []
    content {
      from_port       = var.sg_listener_port_from
      to_port         = var.sg_listener_port_to
      protocol        = var.sg_listener_protocol
      prefix_list_ids = var.allowed_prefix_list_ids
      description     = "Allow from prefix lists"
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "${var.security_group_name}-sg" })
}
