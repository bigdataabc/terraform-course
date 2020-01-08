variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
    default = "us-east-1"
}

variable "ingress_rules" {
   type = list(number)
   default = [8000,8000]
}

variable "egress_rules" {
   type = list(number)
   default = [0,0]
}
