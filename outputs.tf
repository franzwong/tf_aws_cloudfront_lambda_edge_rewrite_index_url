output "lambda_qualified_arn" {
  description = "Qualified ARN of lambda function"
  type = "string"
  value = "${aws_lambda_function.lambda.qualified_arn}"
}