variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
    default = "us-east-1"
}

variable "user_names" {  
    description = "IAM users with these names"  
    type        = list(string)  
    default     = ["sachin1", "lara1"]
}
