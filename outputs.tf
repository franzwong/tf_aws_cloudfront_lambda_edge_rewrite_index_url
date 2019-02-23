output "lambda_qualified_arn" {
  description = "Qualified ARN of lambda function"
  value = "${aws_lambda_function.lambda.qualified_arn}"
}