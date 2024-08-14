//aws_security_group Resource: Creates a security group in the specified VPC.
    //vpc_id: The VPC where the security group will be created, provided as an input variable.
    //name: Name of the security group.
    //description: Description of the security group.
resource "aws_security_group" "this" {
  vpc_id      = var.vpc_id
  name         = var.name
  description  = var.description

  dynamic "ingress" {
    for_each = var.sg_rules != null ? [for rule in var.sg_rules : rule if rule.type == "ingress"] : []
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }

  dynamic "egress" {
    for_each = var.sg_rules != null ? [for rule in var.sg_rules : rule if rule.type == "egress"] : []
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      description = egress.value.description
    }
  }
}

//Dynamic Blocks: These blocks are used to create ingress and egress rules dynamically based on the input variable sg_rules.

    //for_each: Filters sg_rules based on type (ingress or egress) to create the appropriate rules.
    //content: Defines the rule attributes like from_port, to_port, protocol, cidr_blocks, and description.