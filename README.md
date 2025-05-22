# Terraform Load Balancer Module

This module creates and manages a load balancer in your cloud environment.

## Inputs

| Name                     | Description                                   | Type           | Default        | Required |
|--------------------------|-----------------------------------------------|----------------|----------------|----------|
| load_balancer_type       | The type of the load balancer                 | string         | "application"  | No       |
| load_balancer_name       | The name of the load balancer                 | string         | n/a            | Yes      |
| is_internal              | Whether the load balancer is internal         | bool           | false          | No       |
| subnets                  | The subnets for the load balancer             | list(string)   | n/a            | Yes      |
| sg_loadbalancer_id       | The security group for the load balancer      | string         | n/a            | Yes      |
| cross_zone               | Enable cross-zone load balancing              | bool           | true           | No       |
| tags                     | Tags to assign to the load balancer           | map(string)    | {}             | No       |
| create_default_listener  | Whether to create a default listener          | bool           | true           | No       |
| listener_protocol        | The protocol for the listener                 | string         | "HTTP"         | No       |
| listener_port            | The port for the listener                     | number         | 80             | No       |

## Usage

```hcl
module "load_balancer" {
    source               = "path/to/this/module"
    load_balancer_name   = "my-lb"
    subnets              = ["subnet-123", "subnet-456"]
    sg_loadbalancer_id   = "sg-123456"
    # Other variables as needed
}
```

## Outputs

Refer to the module outputs for details on the resources created.
