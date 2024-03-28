### S3 bucket access policy document ###
resource "aws_s3_bucket_policy" "static_web_bucket_policy" {
    bucket = aws_s3_bucket.static_web_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "MYBUCKETPOLICY"
    Statement = [
      {
        Sid       = "IPAllow"
        Effect    = "Allow"
        Principal = "*"
        Action    = ["s3:GetObject", "s3:DeleteObject", "s3:PutObject"]
        Resource  = "${aws_s3_bucket.static_web_bucket.arn}/*"
      },
    ]
  })
}