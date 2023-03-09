



  resource "aws_lambda_function" "this" {
    count = var.enabled ? 1 : 0
    filename = var.filename
    source_code_hash = var.source_code_hash
    function_name = var.function_name
    role          = var.role
    handler       = var.handler
    runtime       = var.runtime
    timeout       = var.timeout
    description   = var.description
    tags          = var.tags
  }
