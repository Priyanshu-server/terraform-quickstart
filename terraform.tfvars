
main_config = {
  region : "us-east-1"
  tags : {
    Environment : "lab"
  }
}

# Networking module variables >>>

basic_sg_config = {
  sg_name        = "web-sg"
  sg_description = "Security group for web/public access"

  ingress = {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

basic_internet_config = {
  igw_name = "main-igw"

  router = {
    rt_name             = "public-route-table"
    internet_route_cidr = "0.0.0.0/0"
  }
}

# <<< Networking module variables

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