resource "aws_instance" "example" {
  ami                    = lookup(var.AMIS, var.AWS_REGION)
  instance_type          = var.INSTANCE_TYPE
  subnet_id = aws_subnet.tf-public-1.id
  vpc_security_group_ids = [module.module-example.security-id]
  key_name = module.module-example.key-name 

  tags = {
    Name = "Demo-21: Terraform module example"
  }

}


module "module-example" {
  source = "./module-security"
  vpc-id = aws_vpc.tf-vpc.id
}
