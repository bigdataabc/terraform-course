resource "aws_db_subnet_group" "tf-mariadb-subnet" {
    name = "tf-mariadb-subnet"
    description = "RDS subnet group"
    subnet_ids = [aws_subnet.tf-private-1.id,aws_subnet.tf-private-2.id]
}

resource "aws_db_parameter_group" "tf-mariadb-parameters" {
    name = "tf-mariadb-parameters"
    family = "mariadb10.2"
    description = "Parameter group"

    parameter {
      name = "max_allowed_packet"
      value = "16777216"
   }

}

resource "aws_db_instance" "tf-mariadb" {
  allocated_storage    = 100 
  engine               = "mariadb"
  engine_version       = "10.2.21"
  instance_class       = "db.t2.small"
  identifier           = "mariadb"
  name                 = "mariadb"
  username             = "admin"   # username
  password             = var.PASSWORD # password
  db_subnet_group_name = aws_db_subnet_group.tf-mariadb-subnet.name
  parameter_group_name = aws_db_parameter_group.tf-mariadb-parameters.name
  multi_az             = "false" 
  vpc_security_group_ids = [aws_security_group.tf-mariadb.id]
  storage_type         = "gp2"
  backup_retention_period = 30 
  availability_zone = aws_subnet.tf-private-1.availability_zone   # prefered AZ
  skip_final_snapshot = true 
  tags  = {
      Name = "tf-mariadb instance"
  }
}
