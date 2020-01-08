resource "aws_instance" "example" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform remote backup example"
  }
}

output "public_ip" {  
  value = aws_instance.example.public_ip  
  description = "The public IP address of the ec2 instance"
}
