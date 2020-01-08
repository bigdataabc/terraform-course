resource "aws_key_pair" "terraformKey" {
  key_name   = "terraform-key3"
  public_key = file("mykey.pub")
}

output "key-name" {
  value       = aws_key_pair.terraformKey.key_name
  description = "Key Name"
}

