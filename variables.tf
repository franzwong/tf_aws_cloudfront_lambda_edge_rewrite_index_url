variable "lambda_function_name" {
  description = "Lambda function name"
  type = "string"
}

variable "log_retention_in_days" {
  description = "Number of days you want to retain log events in the lambda log group"
  type = "string"
  default = "1"
}

variable "lambda_role_name_prefix" {
  description = "Name prefix of IAM role attached to the Lambda Function"
  type = "string"
}
