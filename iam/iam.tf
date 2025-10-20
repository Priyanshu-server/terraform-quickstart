# Lambda iam role

resource "aws_iam_role" "iam_lambda_role" {
  name               = "lambda_exec_role"
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

resource "aws_iam_role_policy_attachment" "lambda_s3_access_attach" {
  role       = aws_iam_role.iam_lambda_role.name
  policy_arn = aws_iam_policy.lambda_s3_access.arn
}

# Glue Role

resource "aws_iam_role" "iam_glue_role" {
  name               = "glue_service_role"
  assume_role_policy = data.aws_iam_policy_document.glue_assume_role_policy.json
  tags = merge(
    var.main_config.tags,
    {
      Name = "glue_service_role"
    }
  )
}

resource "aws_iam_role_policy_attachment" "glue_basic_exec" {
  role       = aws_iam_role.iam_glue_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

resource "aws_iam_role_policy_attachment" "glue_cloudwatch_access" {
  role       = aws_iam_role.iam_glue_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}

resource "aws_iam_role_policy_attachment" "glue_console_acces" {
  role       = aws_iam_role.iam_glue_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSGlueConsoleFullAccess"
}

resource "aws_iam_role_policy_attachment" "attach_glue_logs_and_s3_policy" {
  role       = aws_iam_role.iam_glue_role.name
  policy_arn = aws_iam_policy.glue_logs_and_s3_policy.arn
}