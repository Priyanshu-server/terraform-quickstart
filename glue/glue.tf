
# Python shell Glue Job

resource "aws_glue_job" "python_shell_job" {
  name         = "hello-world-job"
  description  = "An example Python shell job"
  role_arn     = var.glue_config.glue_role_arn
  max_capacity = "0.0625"
  max_retries  = var.glue_config.generic_vars.max_retries
  timeout      = var.glue_config.generic_vars.timeout
  #   connections  = [aws_glue_connection.example.name]

  command {
    script_location = "s3://${var.glue_config.glue_s3_bucket}/glue/jobs/glue_python_one.py"
    name            = "pythonshell"
    python_version  = var.glue_config.glue_python_runtime
  }

  default_arguments = {
    "--job-language"                     = "python"
    "--enable-continuous-cloudwatch-log" = "true"
    "--continuous-log-logGroup"          = var.glue_config.log_vars.log_group_path
    # "--enable-metrics"                   = "true" # enable it if you want to use Glue metrics
    "--TempDir"   = "s3://${var.glue_config.glue_s3_bucket}${var.glue_config.glue_temp_dir}"
    "--region"    = var.main_config.region
    "library-set" = "analytics"
  }

  execution_property {
    max_concurrent_runs = var.glue_config.generic_vars.max_concurrent_runs
  }

  tags = merge(
    var.main_config.tags,
    {
      Name = "hello-world-job"
    }
  )
}
