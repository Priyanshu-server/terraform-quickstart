
resource "aws_cloudwatch_log_group" "glue_logs" {
  name              = var.glue_config.log_vars.log_group_path
  retention_in_days = var.glue_config.log_vars.log_retention_days
}

resource "aws_cloudwatch_log_group" "glue_error_logs" {
  name              = var.glue_config.log_vars.log_error_group_path
  retention_in_days = var.glue_config.log_vars.log_retention_days
}
