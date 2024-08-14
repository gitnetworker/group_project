provider "aws" {
  region = "us-east-1" # Specify your AWS region
}


//Module Declaration: Uses the my_security_group module located in the ./modules/security-group directory.
    //vpc_id: Passes the VPC ID to the module.
    //name: Provides a name for the security group.
    //sg_rules: Defines security group rules in a combined list format. 
    //Each rule is an object specifying its type (ingress or egress), ports, protocol, CIDR blocks, and an optional description.

module "my_security_group" {
  source = "./modules/security-group"

  vpc_id = "vpc-00864c29ad5ca742e" # Ensure this is the correct VPC ID
  name   = "my-unique-security-group" # Updated to a unique name

  sg_rules = [
    {
      type        = "ingress"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTP traffic"
    },
    {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound traffic"
    }
  ]
}

output "security_group_id" {
  value = module.my_security_group.security_group_id
}