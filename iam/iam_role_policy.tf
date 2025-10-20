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

# Glue Assume Role Policy

data "aws_iam_policy_document" "glue_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["glue.amazonaws.com"]
    }
    effect = "Allow"
  }
}

data "aws_iam_policy_document" "glue_cloudwatch_and_s3_access" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:AssociateKmsKey",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      # "cloudwatch:PutMetricData", # enable it if you want to use Glue metrics
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:ListBucket"
    ]

    resources = [
      "arn:aws:logs:*:*:*",
      "arn:aws:s3:::${var.s3_config.glue_bucket}",
      "arn:aws:s3:::${var.s3_config.glue_bucket}/*"
    ]
  }
}

## Glue Access Policy
resource "aws_iam_policy" "glue_logs_and_s3_policy" {
  name        = "glue-logs-and-s3-policy"
  description = "Allow Glue job to access CloudWatch Logs and S3"
  policy      = data.aws_iam_policy_document.glue_cloudwatch_and_s3_access.json
}