# --- Load Balancer Variables ---
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

variable "vpc_id" {
  description = "The VPC ID"
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

# --- Listener Variables ---
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

# --- Security Group Variables ---
variable "security_group_name" {
  description = "The name of the security group"
  type        = string
}

variable "allowed_cidrs" {
  description = "The CIDR blocks to allow"
  type        = list(string)
  default     = []
}

variable "allowed_security_groups" {
  description = "The security groups to allow"
  type        = list(string)
  default     = []
}

variable "allowed_prefix_list_ids" {
  description = "The prefix list IDs to allow"
  type        = list(string)
  default     = []
}

variable "sg_listener_port_from" {
  description = "The starting port for the security group listener"
  type        = number
  default     = 80
}

variable "sg_listener_port_to" {
  description = "The ending port for the security group listener"
  type        = number
  default     = 80
}

variable "sg_listener_protocol" {
  description = "The protocol for the security group listener"
  type        = string
  default     = "tcp"
}
