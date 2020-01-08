variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
    default = "us-east-1"
}
variable "SIZE" {
    default = 50 
}
variable "TYPE" {
    default = "gp2" 
}

variable "INSTANCE_TYPE" {
    default = "c4.2xlarge"
}
variable "AZ-1" {
    default = "us-east-1a"
}

variable "AMIS" {
  default = {
    us-east-1    = "ami-00eb20669e0990cb4"
    us-east-2    = "ami-0c64dd618a49aeee8"
    us-west-1    = "ami-0bce08e823ed38bdd"
    us-west-2    = "ami-08d489468314a58df"
    ca-central-1 = "ami-04070f04f450607dc"
    eu-central-1 = "ami-010fae13a16763bb4"
    eu-west-1	 = "ami-028188d9b49b32a80"
    eu-west-2	 = "ami-04de2b60dd25fbb2e"
    eu-west-3	 = "ami-0652eb0db9b20aeaf"
    eu-north-1	 = "ami-6a1f9414"

  }
}
