#group name
resource "aws_iam_group" "admin_group" {
    name = "admin_group"
}
resource "aws_iam_policy_attachment" "admin-attach" {
    name = "admin-attach"
    groups = [aws_iam_group.admin_group.name]
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

#user name
resource "aws_iam_user" "admin-1" {
    name = "admin1"
}
resource "aws_iam_user" "admin-2" {
    name = "admin2"
}

#adding users in group
resource "aws_iam_group_membership" "administrators-users" {
    name = "administrators-users"
    users = [
        aws_iam_user.admin-1.name,
        aws_iam_user.admin-2.name,
    ]
    group = aws_iam_group.admin_group.name
}
