output "lambda_role_arn" {
  description = "ARN of the IAM role for Lambda"
  value       = aws_iam_role.iam_lambda_role.arn
}

output "glue_role_arn" {
  description = "ARN of the IAM role for Glue"
  value       = aws_iam_role.iam_glue_role.arn
}