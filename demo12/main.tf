resource "aws_volume_attachment" "ebs_attachment-1" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.volume-1.id
  instance_id = aws_instance.tf-example-1.id
}


resource "aws_ebs_volume" "volume-1" {
  availability_zone = var.AZ-1
  size              = var.SIZE
  type = var.TYPE

  tags = {
    Name = "Demo 12: volume"
  }
}


resource "aws_instance" "tf-example-1" {
  ami                    = lookup(var.AMIS, var.AWS_REGION)
  instance_type          = var.INSTANCE_TYPE
  availability_zone     = var.AZ-1
  # the VPC subnet
  subnet_id = aws_subnet.tf-public-1.id
  vpc_security_group_ids = [aws_security_group.tf-security-group.id]
  key_name = aws_key_pair.terraformKey.key_name
  tags = {
    Name = "Demo-12: instance-1"
  }
}


