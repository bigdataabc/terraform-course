output "dhoni" {  
    value = aws_iam_user.users[1].arn   
    description = "The ARN for user Dhoni"
}
output "all_arns" {  
    value = aws_iam_user.users[*].arn  
    description = "The ARNs for all users"
}
