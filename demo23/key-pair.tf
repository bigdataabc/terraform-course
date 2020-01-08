resource "aws_key_pair" "terraformKey" {
  key_name   = "terraform-key"
  public_key = file("mykey.pub")
}
