resource "aws_dynamodb_table" "terraform_locks" {
  name         = "tf-db-432245736679"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
