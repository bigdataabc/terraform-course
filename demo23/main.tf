resource "aws_instance" "tf-example" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = var.INSTANCE_TYPE 
  subnet_id = aws_subnet.tf-public-1.id
  vpc_security_group_ids = [aws_security_group.tf-security-group.id]
  key_name = aws_key_pair.terraformKey.key_name
  private_ip = "10.0.1.10" 
  tags = {
    Name = "Demo-eip: public instance-1"
  }
}

resource "aws_eip" "tf-example-eip" {
  instance = aws_instance.tf-example.id
  vpc = true
}
