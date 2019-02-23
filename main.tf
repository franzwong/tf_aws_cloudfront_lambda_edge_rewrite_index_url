resource "aws_lambda_function" "lambda" {
  function_name    = "${var.lambda_function_name}"
  filename         = "${path.module}/lambda_edge/deploy.zip"
  role             = "${aws_iam_role.lambda.arn}"
  handler          = "index.handler"
  source_code_hash = "${base64sha256(file("${path.module}/lambda_edge/deploy.zip"))}"
  runtime          = "nodejs8.10"
  publish          = true
}

resource "aws_cloudwatch_log_group" "lambda" {
  name              = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = "${var.log_retention_in_days}"
}

resource "aws_iam_role" "lambda" {
  name_prefix         = "${var.lambda_role_name_prefix}"
  assume_role_policy  = "${data.aws_iam_policy_document.lambda-assume-role-policy.json}"
}

resource "aws_iam_role_policy" "lambda" {
  role    = "${aws_iam_role.lambda.id}"
  policy  = "${data.aws_iam_policy_document.lambda-permission-policy.json}"
}

data "aws_iam_policy_document" "lambda-assume-role-policy" {
  statement {
    effect  = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = [
        "lambda.amazonaws.com",
        "edgelambda.amazonaws.com"
      ]
    }
  }
}

data "aws_iam_policy_document" "lambda-permission-policy" {
  statement {
    effect  = "Allow"
    actions = [
      "logs:CreateLogStream",
			"logs:PutLogEvents"
    ]
    resources = ["${aws_cloudwatch_log_group.lambda.arn}"]
  }
}