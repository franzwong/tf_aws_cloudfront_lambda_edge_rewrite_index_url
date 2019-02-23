# tf_aws_cloudfront_lambda_edge_rewrite_index_url
A Terraform module containing Lambda@Edge to rewrite url to index.html (e.g. rewrite http://www.example.com/about/ to http://www.example.com/about/index.html)

## Input Variables
* `lambda_function_name` - (Required) Lambda function name
* `log_retention_in_days` - (Optional) Number of days you want to retain log events in the lambda log group. Defaults to 1 day.
* `lambda_role_name_prefix` - (Required) Name prefix of IAM role attached to the Lambda Function

## Outputs
* `lambda_qualified_arn` - Qualified ARN of lambda function

## Build
```
make
```

## Usage example
```
module cloudfront_lambda {
  source                = "github.com/franzwong/tf_aws_cloudfront_lambda_edge_rewrite_index_url"

  lambda_function_name      = "example-com-cloudfront-rewriteurl"
  log_retention_in_days     = "1"
  lambda_role_name_prefix   = "example-com-cloudfront-rewriteurl-"
}
```

## Reference

[Implementing Default Directory Indexes in Amazon S3-backed Amazon CloudFront Origins Using Lambda@Edge](https://aws.amazon.com/blogs/compute/implementing-default-directory-indexes-in-amazon-s3-backed-amazon-cloudfront-origins-using-lambdaedge/)

## License

### The MIT License (MIT)

Copyright (c) `2019` `Franz Wong`

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
