resource "aws_instance" "tf-example" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"

  #subnet
  subnet_id = aws_subnet.tf-public-1.id

  #security group
  vpc_security_group_ids = [aws_security_group.tf-instance.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

}
