
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
  lambda_bucket : "bucket-1289a27"
  glue_bucket : "bucket-1289a28"
}

glue_config = {
  glue_python_runtime : "3.9"
  glue_temp_dir : "/glue/tmp/"

  log_vars = {
    log_group_path : "/aws-glue/python-jobs/output"
    log_error_group_path : "/aws-glue/python-jobs/error"
    log_retention_days : 3
  }

  generic_vars : {
    timeout : 60
    max_retries : 0
    max_concurrent_runs : 1
  }
}