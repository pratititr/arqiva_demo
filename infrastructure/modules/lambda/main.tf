resource "aws_lambda_function" "example_lambda" {
  function_name = var.function_name
  handler       = var.handler
  runtime       = var.runtime
  filename      = var.file_path
  role          = var.role_arn
}