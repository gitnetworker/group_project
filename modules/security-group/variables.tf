//Variable Definition: 
//Defines a variable vpc_id to hold the ID of the existing VPC. 
//This variable allows flexibility by letting you specify the VPC ID without hardcoding it into the module.
variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created."
  type        = string
}
//vpc_id Variable: 
//Declares the vpc_id variable that will be used to specify the VPC ID where the security group will be created.


// The name of the security group.
variable "name" {
  description = "The name of the security group."
  type        = string
  default     = "default-sg"
}

//Optional description for the security group
variable "description" {
  description = "A description of the security group."
  type        = string
  default     = ""
}

//sg_rules: A list of objects defining the security group rules. 
//Each object specifies the type (ingress or egress), ports, protocol, CIDR blocks, and an optional description.
variable "sg_rules" {
  description = "List of security group rules. Each rule is a map containing type (ingress/egress), from_port, to_port, protocol, cidr_blocks, and an optional description."
  type = list(object({
    type         = string
    from_port    = number
    to_port      = number
    protocol     = string
    cidr_blocks  = list(string)
    description  = string
  }))
  default = []
}
