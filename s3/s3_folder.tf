locals {
  lambda_zip_files = fileset("${path.root}/lambda/scripts/compressed", "*.zip")
}

resource "aws_s3_object" "lambda_zips" {
  for_each = { for file in local.lambda_zip_files : file => file }

  bucket = aws_s3_bucket.lambda_bucket.id
  key    = "lambda/${each.key}"
  source = "${path.root}/lambda/scripts/compressed/${each.key}"
  etag   = filemd5("${path.root}/lambda/scripts/compressed/${each.key}")

  depends_on = [aws_s3_bucket.lambda_bucket]
}