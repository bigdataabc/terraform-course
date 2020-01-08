resource "aws_instance" "instance_example" {
  ami                    = lookup(var.AMIS, var.AWS_REGION)
  instance_type          = "t2.micro"
  availability_zone = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.instance.id]
  key_name = aws_key_pair.terraformKey.key_name 
  tags = {
    Name = "Demo-6: Terraform security groups and key pair creation"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-instance5"
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow outgoing traffic to anywhere.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_key_pair" "terraformKey" {
  key_name   = "key-terraform5"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDzqqKTTuqqO5ccecllTzhIKtgaXVx6b4TY5GgFDiuzSPkba9WRtgJEqePr0hmjKEka0L7qchF9foLMOhNv3eXvMI1wQfhv24C/IUyx6qqKIq12SNYQslSynXNsafxb8co322xscP/Gt8AHZVF9tfVE2JKvTHDkWBYk82Wltn/yD031sOAV56BbRLz411+11ITUZ5RAmSz1EXarlmGy7b+m3FfERjpNMSgnMnlQ2hzSwNuD6KkrvSMYsKh6cVZFL32oTKtjRE07mde011+3YE/3WAGxReW1Pe0Yg74lnBALIUoB9Vy7BIZzTl+ZaFZ1usM+XYnEE4JCmmP51osoZDEL/uXrjlT75sDJqvU6Ac62/xr3rPe5y61OoC7SJsHmdyj91XKQ6aE4zDlbqOk93OTBDOE6fm8BekkkzLReHdpQhDohPuf5irGs4K3HQK7XIeKjcOhA4ukhWV/qZa325FZr9cX9pQSpux74KpTIDTYlRTW7tjp+p/XtjLf+eLA+k7s= EK@DESKTOP-GH08SBT"
}

output "public_ip" {
  value       = aws_instance.instance_example.public_ip
  description = "The public IP address of the ec2 instance"
}
