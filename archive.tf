## First Lambda Function

resource "archive_file" "lambda_one_zip" {
  type        = "zip"
  source_file = "${path.root}/scripts/lambda/lambda_one_function.py"
  output_path = "${path.root}/scripts/lambda/compressed/lambda_one_function.zip"
}