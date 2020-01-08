resource "aws_instance" "tf-example-1" {
  ami                    = lookup(var.AMIS, var.AWS_REGION)
  instance_type          = var.INSTANCE_TYPE
  subnet_id = aws_subnet.tf-public-1.id
  vpc_security_group_ids = [aws_security_group.tf-security-group.id]
  key_name = aws_key_pair.terraformKey.key_name
  iam_instance_profile = aws_iam_instance_profile.bucket-role-instanceprofile.name 
  tags = {
    Name = "Demo-15: instance-1"
  }
}


