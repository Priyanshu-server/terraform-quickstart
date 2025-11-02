# Create a S3 Bucket

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  numeric = true
  special = false
}


resource "aws_s3_bucket" "lambda_bucket" {
  bucket        = "${var.s3_config.lambda_bucket}-${random_string.suffix.result}"
  force_destroy = true

  tags = merge(
    var.main_config.tags,
    {
      Name = "${var.s3_config.lambda_bucket}-${random_string.suffix.result}"
    }
  )
}

resource "aws_s3_bucket" "glue_bucket" {
  bucket        = "${var.s3_config.glue_bucket}-${random_string.suffix.result}"
  force_destroy = true

  tags = merge(
    var.main_config.tags,
    {
      Name = "${var.s3_config.glue_bucket}-${random_string.suffix.result}"
    }
  )
}