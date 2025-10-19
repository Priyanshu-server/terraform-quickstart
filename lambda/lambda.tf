

## First Lambda Function

resource "archive_file" "lambda_one_zip" {
  type        = "zip"
  source_file = "${path.module}/scripts/lambda_one_function.py"
  output_path = "${path.module}/scripts/compressed/lambda_one_function.zip"
}

resource "aws_lambda_function" "lambda_one" {
  function_name = "hello_world_lambda"
  role          = var.lambda_config.lambda_role_arn
  handler       = "lambda_one_function.handler"
  runtime       = var.lambda_config.lambda_runtime
  filename      = archive_file.lambda_one_zip.output_path
  tags = merge(
    var.main_config.tags,
    {
      Name = "hello_world_lambda"
    }
  )
}
