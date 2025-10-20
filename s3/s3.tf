# Create a S3 Bucket

resource "aws_s3_bucket" "lambda_bucket" {
  bucket = var.s3_config.lambda_bucket

  tags = merge(
    var.main_config.tags,
    {
      Name = var.s3_config.lambda_bucket
    }
  )
}

resource "aws_s3_bucket" "glue_bucket" {
  bucket = var.s3_config.glue_bucket

  tags = merge(
    var.main_config.tags,
    {
      Name = var.s3_config.glue_bucket
    }
  )
}