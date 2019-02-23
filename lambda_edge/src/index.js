'use strict'

// Source code is copied from Amazon
// https://aws.amazon.com/blogs/compute/implementing-default-directory-indexes-in-amazon-s3-backed-amazon-cloudfront-origins-using-lambdaedge/
exports.handler = (event, _, callback) => {
  const request = event.Records[0].cf.request
  const olduri = request.uri
  const newuri = olduri.replace(/\/$/, '\/index.html')
  request.uri = newuri
  return callback(null, request)
}
