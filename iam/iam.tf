resource "aws_iam_role" "iam_lambda_role" {
  name = "lambda_exec_role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
  tags = merge(
    var.main_config.tags,
    {
      Name = "lambda_exec_role"
    }
  )
}

resource "aws_iam_role_policy_attachment" "lambda_basic_exec" {
  role       = aws_iam_role.iam_lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
