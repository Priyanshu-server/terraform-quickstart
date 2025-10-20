output "lambda_bucket_name" {
  value = aws_s3_bucket.lambda_bucket.bucket
}

output "glue_bucket_name" {
  value = aws_s3_bucket.glue_bucket.bucket
}