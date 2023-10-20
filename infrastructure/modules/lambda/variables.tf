variable "function_name" {
  type        = string
  description = "Name of the Lambda function"
}

variable "handler" {
  type        = string
  description = "Handler function for the Lambda"
}

variable "runtime" {
  type        = string
  description = "Runtime for the Lambda function"
}

variable "file_path" {
  type        = string
  description = "Path of lambda function (.zip)"
}

variable "role_arn" {
  type        = string
  description = "Custom Role"
}
