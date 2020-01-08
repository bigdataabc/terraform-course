resource "aws_instance" "example" {
  ami                    = lookup(var.AMIS, var.AWS_REGION)
  instance_type          = var.INSTANCE_TYPE
  vpc_security_group_ids = [aws_security_group.instance.id]
  key_name = aws_key_pair.terraformKey.key_name 

  user_data = templatefile("script.sh",{ content = var.CONTENT })
  tags = {
    Name = "Demo-8: Terraform Template File function example"
  }

}

output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP address of the ec2 instance"
}
