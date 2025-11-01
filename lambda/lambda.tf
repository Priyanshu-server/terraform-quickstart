
# Hello world (lambda_one)
resource "aws_lambda_function" "lambda_one" {
  function_name = "hello_world_lambda"
  role          = var.lambda_config.lambda_role_arn
  handler       = "lambda_one_function.handler"
  runtime       = var.lambda_config.lambda_runtime

  s3_bucket = var.lambda_config.lambda_s3_bucket
  s3_key    = "lambda/lambda_one_function.zip" # lambda/(zip name)

  environment {
    variables = {
      aws_region = var.main_config.region
    }
  }

  tags = merge(
    var.main_config.tags,
    {
      Name = "hello_world_lambda"
    }
  )
}
