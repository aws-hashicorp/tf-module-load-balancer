variable "load_balancer_type" {
  description = "The type of the load balancer"
  type        = string
  default     = "application"
}

variable "load_balancer_name" {
  description = "The name of the load balancer"
  type        = string
}

variable "is_internal" {
  description = "Whether the load balancer is internal"
  type        = bool
  default     = false
}

variable "subnets" {
  description = "The subnets for the load balancer"
  type        = list(string)
}

variable "sg_loadbalancer_id" {
  description = "The security group for the load balancer"
  type        = string
}

variable "cross_zone" {
  description = "Whether to enable cross-zone load balancing"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to assign to the load balancer"
  type        = map(string)
  default     = {}
}

variable "create_default_listener" {
  description = "Whether to create a default listener"
  type        = bool
  default     = true
}

variable "listener_protocol" {
  description = "The protocol for the listener"
  type        = string
  default     = "HTTP"
}

variable "listener_port" {
  description = "The port for the listener"
  type        = number
  default     = 80
}
