resource "aws_iam_role" "bucket-role" {
    name = "bucket-role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "bucket-role-instanceprofile" {
    name = "bucket-role"
    role = aws_iam_role.bucket-role.name
}

resource "aws_iam_role_policy" "bucket-role-policy" {
    name = "bucket-role-policy"
    role = aws_iam_role.bucket-role.id
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "s3:*"
            ],
            "Resource": [
              "arn:aws:s3:::bucket-432245736679",
              "arn:aws:s3:::bucket-432245736679/*"
            ]
        }
    ]
}
EOF
}

