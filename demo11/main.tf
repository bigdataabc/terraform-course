resource "aws_instance" "tf-example1" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = var.INSTANCE_TYPE 
  subnet_id = aws_subnet.tf-public-1.id
  vpc_security_group_ids = [aws_security_group.tf-security-group.id, aws_vpc.tf-vpc.default_security_group_id]
  key_name = aws_key_pair.terraformKey.key_name
  tags = {
    Name = "Demo-9: public instance-1"
  }

}
resource "aws_instance" "tf-example2" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = var.INSTANCE_TYPE
  subnet_id = aws_subnet.tf-public-2.id
  vpc_security_group_ids = [aws_security_group.tf-security-group.id]
  key_name = aws_key_pair.terraformKey.key_name
  tags = {
    Name = "Demo-9: public instance-2"
  }
}
resource "aws_instance" "tf-example3" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = var.INSTANCE_TYPE
  subnet_id = aws_subnet.tf-private-1.id
  key_name = aws_key_pair.terraformKey.key_name
  tags = {
    Name = "Demo-9: private instance-1"
  }
}

