## First Lambda Function

resource "archive_file" "lambda_one_zip" {
  type        = "zip"
  source_file = "${path.root}/lambda/scripts/lambda_one_function.py"
  output_path = "${path.root}/lambda/scripts/compressed/lambda_one_function.zip"
}