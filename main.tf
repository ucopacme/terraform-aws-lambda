
resource "aws_lambda_function" "this" {
  count            = var.enabled ? 1 : 0
  filename         = var.filename
  source_code_hash = var.source_code_hash
  function_name    = var.function_name
  role             = var.role
  handler          = var.handler
  runtime          = var.runtime
  timeout          = var.timeout
  description      = var.description
  tags             = var.tags
  publish          = var.publish

  memory_size      = var.memory_size  # <-- Added RAM configuration

  environment {
    variables = var.environment
  }

  # Optional VPC config
  dynamic "vpc_config" {
    for_each = length(var.subnet_ids) > 0 && length(var.security_group_ids) > 0 ? [1] : []
    content {
      subnet_ids         = var.subnet_ids
      security_group_ids = var.security_group_ids
    }
  }
}

resource "aws_lambda_permission" "allow_events_bridge_to_run_lambda" {
  count         = var.enabled ? 1 : 0
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this[0].function_name
  principal     = "events.amazonaws.com"
}

