output "public_ip-1" {
  value       = aws_instance.tf-example1.public_ip
  description = "The public IP address of the 1st ec2 instance"
}
output "public_ip-2" {
  value       = aws_instance.tf-example2.public_ip
  description = "The public IP address of the 2nd ec2 instance"
}

output "private_ip" {
  value       = aws_instance.tf-example3.private_ip
  description = "The private IP address of the 3rd ec2 instance"
}

