//Output: Exposes the ID of the security group created by the module. 
//This can be used for referencing or verification purposes.
output "security_group_id" {
  description = "The ID of the created security group."
  value       = aws_security_group.this.id
}
//Provides the ID of the created security group, which can be used for referencing or further configuration.