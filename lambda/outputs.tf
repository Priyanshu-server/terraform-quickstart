output "lambda_one_arn" {
  description = "The ARN of the first Lambda function"
  value       = aws_lambda_function.lambda_one.arn
}