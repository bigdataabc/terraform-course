terraform {
  backend "s3" {
    bucket = "tfstate-432245736679"
    key    = "terraform.tfstate"
    region = "us-east-1" 
  }
}
