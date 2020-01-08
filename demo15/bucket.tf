resource "aws_s3_bucket" "b" {
    bucket = "bucket-432245736679"
    acl = "private"

    tags = {
        Name = "bucket-432245736679"
    }
}
