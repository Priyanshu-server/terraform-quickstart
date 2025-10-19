data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    effect = "Allow"
  }
}

data "aws_iam_policy_document" "lambda_s3_access" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion"
    ]

    resources = [
      "arn:aws:s3:::${var.s3_config.lambda_bucket}/*"
    ]
  }
}

# Converting Data into Policy

## Lambda S3 Access Policy
resource "aws_iam_policy" "lambda_s3_access" {
  name        = "lambda-s3-read-access"
  description = "Allow Lambda to read deployment packages from S3"
  policy      = data.aws_iam_policy_document.lambda_s3_access.json
}

