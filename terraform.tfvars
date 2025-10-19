
main_config = {
  region : "us-east-1"
  tags : {
    Environment : "lab"
  }
}

lambda_config = {
  lambda_runtime : "python3.9"
}

s3_config = {
  lambda_bucket : "lambda-bucket-1289a27"
}