output "public_ip-1" {
  value       = aws_instance.tf-example.public_ip
  description = "The public IP address of the 1st ec2 instance"
}
