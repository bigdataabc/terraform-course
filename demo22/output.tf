output "instance" {
  value = aws_instance.tf-example.public_ip
}
output "rds" {
  value = "${aws_db_instance.tf-mariadb.endpoint}"
}