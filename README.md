# group_project

Summary

    Root Configuration (main.tf, variables.tf):
        Sets up the AWS provider.
        Defines variables and module usage.
        Outputs the security group ID.

    Security Group Module (modules/security-group/main.tf, variables.tf, outputs.tf):
        Defines a security group with dynamic ingress and egress rules.
        Accepts parameters for VPC ID, name, description, and security group rules.
        Outputs the security group ID.

This setup allows you to manage the creation of security groups dynamically and flexibly, with rules provided through a single variable and easily adaptable to various VPCs and security group requirements.