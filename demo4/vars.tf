variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-west-1"
}
variable "AMIS" {
  default = {
    us-east-1 = "ami-07d0cf3af28718ef8"
    us-west-1 = "ami-01bc871dea1a7f019"
    eu-west-1 = "ami-078919b40306cb232"
  }
}
