resource "aws_security_group" "tf-instance" {
  vpc_id = aws_vpc.tf-vpc.id
  name = "instance-ssh"
  description = "allow instance"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  } 
}

resource "aws_security_group" "tf-mariadb" {
  vpc_id = aws_vpc.tf-vpc.id
  name = "mariadb-ssh"
  description = "allow mariadb"
  ingress {
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      security_groups = [aws_security_group.tf-instance.id]
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      self = true
  }
}

