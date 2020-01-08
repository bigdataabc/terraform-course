resource "aws_instance" "example" {
  ami                    = lookup(var.AMIS, var.AWS_REGION)
  instance_type          = var.INSTANCE_TYPE
  vpc_security_group_ids = [aws_security_group.instance.id]
  key_name = aws_key_pair.terraformKey.key_name 
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh",
    ]
  }

  connection {
   user = var.USER
   private_key = file("mykey")
   host = aws_instance.example.public_ip
  }

  tags = {
    Name = "Demo-7: Terraform Script Execution Example"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-instance"
  ingress {
    from_port   = 80
    to_port     = 80
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
  key_name   = "terraform-key"
  public_key = file("mykey.pub")
}

output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP address of the ec2 instance"
}
