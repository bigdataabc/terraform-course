provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-07d0cf3af28718ef8"
  instance_type = "t2.micro"
  tags = {    
    Name = "Terraform ec2 instance example"  
  }
}
