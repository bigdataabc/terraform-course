resource "aws_instance" "tf-example" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = var.environment == "prod" ? "t2.medium" :"t2.micro"
  tags = {
    Name = "Demo 20 - Terraform ec2 instance example"
  }
}
