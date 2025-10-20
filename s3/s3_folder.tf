locals {
  lambda_zip_files = fileset("${path.root}/scripts/lambda/compressed", "*.zip")
}
locals {
  glue_job_files = fileset("${path.root}/scripts/glue", "*.py")
}

resource "aws_s3_object" "lambda_zips" {
  for_each = { for file in local.lambda_zip_files : file => file }

  bucket = aws_s3_bucket.lambda_bucket.id
  key    = "lambda/${each.key}"
  source = "${path.root}/scripts/lambda/compressed/${each.key}"
  etag   = filemd5("${path.root}/scripts/lambda/compressed/${each.key}")

  depends_on = [aws_s3_bucket.lambda_bucket]
}

resource "aws_s3_object" "glue_jobs" {
  for_each = { for file in local.glue_job_files : file => file }

  bucket = aws_s3_bucket.glue_bucket.id
  key    = "glue/jobs/${each.key}"
  source = "${path.root}/scripts/glue/${each.key}"
  etag   = filemd5("${path.root}/scripts/glue/${each.key}")

  depends_on = [aws_s3_bucket.glue_bucket]
}